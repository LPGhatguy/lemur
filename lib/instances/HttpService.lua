local BaseInstance = import("./BaseInstance")
local exists, json = pcall(require, "dkjson")

local HttpService = BaseInstance:extend("HttpService")

function HttpService.prototype:JSONEncode(input)
	if not exists then
		error("Please install dkjson to use HttpService:JSONEncode.")
	else
		return json.encode(input)
	end
end

function HttpService.prototype:JSONDecode(input)
	if not exists then
		error("Please install dkjson to use HttpService:JSONDecode.")
	else
		return json.decode(input)
	end
end

return HttpService