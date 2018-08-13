local exists, http = pcall(require, "socket.http")

local httpShim = {}

function httpShim.get(url)
	error("Please install `luasocket` to use HTTP features.", 2)
end

if exists then
	function httpShim.get(url)
		return (http.request(url))
	end
end

return httpShim