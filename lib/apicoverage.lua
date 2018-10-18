require("lib.baste").global()

local httpExists, http = pcall(require, "socket.http")
local instances = import("./instances")
local json = import("./json")

if not httpExists then
	error("Please install `luasocket` to use the API coverage.")
end

local urls = {
	APIDump = "https://s3.amazonaws.com/setup.roblox.com/{VERSION_ID}-API-Dump.json",
	GetVersion = "http://versioncompatibility.api.roblox.com/GetCurrentClientVersionUpload?binaryType=WindowsStudio&apiKey=76e5a40c-3ae1-4028-9f10-7c62520bd94f",
}

-- Get current version of Roblox to get the latest JSON dump. The url returns it in quotes, so strip the quotes.
local currentVersion = http.request(urls.GetVersion):match("\"(.+)\"")
local apiDumpUrl = urls.APIDump:gsub("{VERSION_ID}", currentVersion)
local apiDumpBody = http.request(apiDumpUrl)
local apiDump = json.decode(apiDumpBody)

local COVERAGE_CLASS_OUTPUT_LINE = "[%d%%] %s"
local COVERAGE_MEMBER_OUTPUT_LINE = "\t[%s] %s"
local PRIMITIVE_PROPERTIES = {
	-- dumpType = luaType
	bool = "boolean",
	double = "number",
	float = "number",
	int = "number",
	int64 = "number",
	string = "string",
}

-- Replace Instance with BaseInstance.
apiDump.Classes[1].Name = "BaseInstance"

local function verifyFunction(instance, member)
	-- TODO: Verify return types
	local metatable = getmetatable(instance)
	local method = metatable.class.prototype[member.Name]
	return method ~= nil
end

local function verifyProperty(instance, member)
	local metatable = getmetatable(instance)
	local property = metatable.class.properties[member.Name]
	if not property then return false end

	if member.ValueType.Category == "Primitive" then
		return type(property.getDefault(instance)) == PRIMITIVE_PROPERTIES[member.ValueType.Name]
	end

	return false
end

local coverage = {}

for _, class in ipairs(apiDump.Classes) do
	local skip = false

	for _, tag in ipairs(class.Tags or {}) do
		-- Lemur has no obligation to support deprecated instances
		if tag == "Deprecated" then
			skip = true
			break
		end
	end

	local classCoverage = {
		Created = false,
		Results = {},
	}

	if not skip then
		local instanceExists, instanceReference = pcall(import, "./lib/instances/" .. class.Name)
		classCoverage.Created = instanceExists

		if instanceExists then
			local instance = instanceReference:new()

			for _, member in ipairs(class.Members) do
				local skipMember = false

				for _, tag in ipairs(member.Tags or {}) do
					if tag == "Deprecated" then
						skipMember = true
						break
					end
				end

				if not skipMember then
					local success = false

					if member.MemberType == "Function" then
						success = verifyFunction(instance, member)
					elseif member.MemberType == "Property" then
						success = verifyProperty(instance, member)
					end

					classCoverage.Results[member.Name] = {
						Created = true,
						Success = success,
					}

					class.Members[member.Name] = nil
				end
			end
		else
			-- Instance doesn't exist, everything fails!!!
			for _, member in ipairs(class.Members) do
				classCoverage.Results[member.Name] = {
					Success = false,
				}
			end
		end
	end

	coverage[class.Name] = classCoverage
end

-- Output
local averageInfoPassed, averageInfoTotal = 0, 0

for name, results in pairs(coverage) do
	local output = {}
	local successSum, successTotal = 0, 0

	for memberName, result in pairs(results.Results) do
		local numberSuccess = (result.Success and 1 or 0)
		successSum = successSum + numberSuccess
		successTotal = successTotal + 1
		output[#output + 1] = COVERAGE_MEMBER_OUTPUT_LINE:format(
			result.Success and "+" or "-",
			memberName
		)

		averageInfoPassed = averageInfoPassed + numberSuccess
		averageInfoTotal = averageInfoTotal + 1
	end

	local average = successSum == 0 and 0 or (successSum / successTotal) * 100

	if not results.Created then
		name = name .. " [UNIMPLEMENTED]"
	end

	print(COVERAGE_CLASS_OUTPUT_LINE:format(average, name))

	for _, line in pairs(output) do
		print(line)
	end
end

print(("Total API coverage: %.02f%%"):format((averageInfoPassed / averageInfoTotal) * 100))
