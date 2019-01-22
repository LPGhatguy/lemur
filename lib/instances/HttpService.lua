local BaseInstance = import("./BaseInstance")
local typeof = import("../functions/typeof")
local json = import("../json")

local HttpService = BaseInstance:extend("HttpService")

local guidCounter = 0

local GUID_DASH_POINTS = {
	[8] = true,
	[12] = true,
	[16] = true,
	[20] = true,
}

function HttpService.prototype:JSONEncode(input)
	return json.encode(input)
end

function HttpService.prototype:JSONDecode(input)
	return json.decode(input)
end

function HttpService.prototype:GenerateGUID(wrapInCurlyBraces)
	local argType = typeof(wrapInCurlyBraces)
	if wrapInCurlyBraces ~= nil and argType ~= "boolean" then
		error(("Unable to cast %s to bool"):format(argType), 2)
	end

	local zeroPadded = ("%032x"):format(guidCounter)
	local guid = ""
	for index = 1, 32 do
		guid = guid .. zeroPadded:sub(index, index)
		if GUID_DASH_POINTS[index] then
			guid = guid .. "-"
		end
	end
	guidCounter = guidCounter + 1

	--[[
		`GenerateGUID` allows any value type for `wrapInCurlyBraces`, but it
		only omits the curly braces when `wrapInCurlyBraces` is set to `false`
	]]
	if wrapInCurlyBraces ~= false then
		guid = "{" .. guid .. "}"
	end

	return guid
end

return HttpService