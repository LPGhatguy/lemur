local BaseInstance = import("./BaseInstance")
local json = import("../json")

local HttpService = BaseInstance:extend("HttpService")

function HttpService:init(instance, httpImpl)
	local internalInstance = getmetatable(instance).instance
	internalInstance.httpImpl = httpImpl
end

function HttpService.prototype:JSONEncode(input)
	return json.encode(input)
end

function HttpService.prototype:JSONDecode(input)
	return json.decode(input)
end

function HttpService.prototype:RequestAsync(options)
	local internalInstance = getmetatable(self).instance
	local httpImpl = internalInstance.httpImpl

	if type(options) ~= "table" then
		error(("Bad argument #1 to RequestAsync: expected table, found %s"):format(type(options)), 2)
	end

	local url = options.Url
	local method = options.Method
	local headers = options.Headers
	local body = options.body

	if type(url) ~= "string" then
		error(("Option `Url` must be a string, but it was a %s"):format(type(url)), 2)
	end

	if method ~= nil and type(method) ~= "string" then
		error(("Option `Method` must be a string or nil, but it was a %s"):format(type(url)), 2)
	end

	if headers ~= nil and type(headers) ~= "table" then
		error(("Option `Headers` must be a table or nil, but it was a %s"):format(type(url)), 2)
	end

	if body ~= nil and type(body) ~= "string" then
		error(("Option `Body` must be a string or nil, but it was a %s"):format(type(url)), 2)
	end

	if headers == nil then
		headers = {}
	end

	if body ~= nil then
		headers["Content-Length"] = #body
	end

	local responseBody = {}

	local _, statusCode, responseHeaders = httpImpl.request({
		url = url,
		sink = httpImpl.tableSink(responseBody),
		method = method,
		headers = headers,
		source = body,
	})

	return {
		Success = statusCode >= 200 and statusCode <= 399,
		StatusCode = statusCode,
		StatusMessage = "uhhh",
		Headers = responseHeaders,
		Body = table.concat(responseBody),
	}
end

function HttpService.prototype:GetAsync()
	error("GetAsync is not implemented by Lemur -- use RequestAsync instead.", 2)
end

function HttpService.prototype:PostAsync()
	error("PostAsync is not implemented by Lemur -- use RequestAsync instead.", 2)
end

return HttpService