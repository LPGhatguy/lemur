local httpExists, socketHttp = pcall(require, "socket.http")
local ltn12Exists, ltn12 = pcall(require, "ltn12")

local http = {}

function http.request()
	error("Please install `luasocket` to use HTTP features.", 2)
end

if httpExists and ltn12Exists then
	http.request = socketHttp.request
	http.tableSink = ltn12.sink.table
end

return http