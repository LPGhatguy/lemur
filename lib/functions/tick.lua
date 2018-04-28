local success, socket = pcall(require, "socket")

if success then
	return socket.gettime
else
	return os.clock
end
