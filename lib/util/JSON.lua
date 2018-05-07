local exists, json = pcall(require, "dkjson")

local JSON = {}

function JSON.Encode(input)
	if not exists then
		error("Please install dkjson to use HttpService:JSONEncode.")
	else
		return json.encode(input)
	end
end

function JSON.Decode(input)
	if not exists then
		error("Please install dkjson to use HttpService:JSONDecode.")
	else
		return json.decode(input)
	end
end

return JSON