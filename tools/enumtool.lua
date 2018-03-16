--[[
	Enum Tool by Kampfkarren.
	Automatically creates Enums from Anaminus' API dump.

	Requires lua-requests.
--]]

print("---Enum Tool---")

-- Check if the lib folder exists before doing anything
if not os.rename("lib/", "lib/") then
	error("lib/ does not exist. Make sure to run this in the root directory! (i.e. lua tools/enumtoo.lua)")
end

local requests = require("requests")
local response = requests.get("https://anaminus.github.io/rbx/json/api/latest.json")

if response.status_code ~= 200 then
	error("Couldn't get the API dump from Anaminus' repo!")
	return
end

local json = response.json()
local enums = {}

for _,class in pairs(json) do
	if class.type == "EnumItem" then
		local enum = enums[class.Enum]

		if not enum then
			enum = {}
			enums[class.Enum] = enum
		end
		
		enum[class.Name] = class.Value
	end
end

print("Generated table of enums. Writing...")

-- Commented the bottom code out. It writes a file for every enum.

--[[
local codeFormat = [\[-- This file was automatically generated by tools/enumtool.lua!

return {]\]

for enumName, items in pairs(enums) do
	local code = codeFormat

	for itemName, itemValue in pairs(items) do
		code = string.format("%s\n\t[%q] = %d,", code, itemName, itemValue)
	end

	code = code .. "\n}"

	local filename = enumName .. ".lua"

	local file = io.open("lib/Enum/"..filename, "w")
	file:write(code)
	file:close()

	print("Wrote to "..filename)
end
--]]

print("Writing file")

local init = io.open("lib/EnumList.lua", "w")

local code = [[-- This file was automatically generated by tools/enumtool.lua!

return {]]

for enumName, items in pairs(enums) do
	code = string.format("%s\n\t[%q] = {", code, enumName)

	for itemName, itemValue in pairs(items) do
		code = string.format("%s\n\t\t[%q] = %d,", code, itemName, itemValue)
	end

	code = code .. "\n\t},"
end

code = code .. "\n}"

init:write(code)
init:close()
