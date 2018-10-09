local exists, dkjson = pcall(require, "dkjson")

local json = {}

function json.encode(input)
	error("Please install `dkjson` to use JSON features.", 2)
end

function json.decode(input)
	error("Please install `dkjson` to use JSON features.", 2)
end

if exists then
	json.encode = dkjson.encode
	json.decode = function(input)

		local result, _, err = dkjson.decode(input)

		if err then
			return 'Can\'t parse JSON'
		else
			return result
		end
	end
end

return json