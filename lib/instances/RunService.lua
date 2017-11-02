local Signal = import("../Signal")

local RunService = {}

function RunService:init()
	self.Heartbeat = Signal.new()
end

return RunService