local exists, dkjson = pcall(require, "dkjson")

local json = {}

function json.encode(input)
	if not exists then
		error("Please install dkjson to use json.encode.")
	else
		return dkjson.encode(input)
	end
end

function json.decode(input)
	if not exists then
		error("Please install dkjson to use json.decode")
	else
		return dkjson.decode(input)
	end
end

return json