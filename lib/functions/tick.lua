local success, socket = pcall(require, "socket")

_G.__LEMUR_NO_HIGH_PERFORMANCE_TIMER__ = not success

if success then
	return socket.gettime
else
	return os.clock
end
