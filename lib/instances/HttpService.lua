local BaseInstance = import("./BaseInstance")
local JSON = import("../util/JSON")

local HttpService = BaseInstance:extend("HttpService")

function HttpService.prototype:JSONEncode(input)
	return JSON.Encode(input)
end

function HttpService.prototype:JSONDecode(input)
	return JSON.Decode(input)
end

return HttpService