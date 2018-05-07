local BaseInstance = import("./BaseInstance")
local json = import("../json")

local HttpService = BaseInstance:extend("HttpService")

function HttpService.prototype:JSONEncode(input)
	return json.encode(input)
end

function HttpService.prototype:JSONDecode(input)
	return json.decode(input)
end

return HttpService