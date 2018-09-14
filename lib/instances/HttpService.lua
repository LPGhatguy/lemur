local BaseInstance = import("./BaseInstance")
local validateType = import("../validateType")
local json = import("../json")

local HttpService = BaseInstance:extend("HttpService")

function HttpService.prototype:JSONEncode(input)
	return json.encode(input)
end

function HttpService.prototype:JSONDecode(input)
	return json.decode(input)
end

function HttpService.prototype:GenerateGUID(wrapInCurlyBraces)
	validateType("wrapInCurlyBraces", wrapInCurlyBraces, "boolean")

	if wrapInCurlyBraces then
		return "{04AEBFEA-87FC-480F-A98B-E5E221007A90}"
	else
		return "04AEBFEA-87FC-480F-A98B-E5E221007A90"
	end
end

return HttpService