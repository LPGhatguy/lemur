local Signal = require("lemur.Signal")

local RunService = {}

function RunService:init()
	self.Heartbeat = Signal.new()
end

return RunService