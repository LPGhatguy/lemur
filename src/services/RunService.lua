local root = (...):match("^(.-%.)[^.]+%.[^.]+$")

local Signal = require(root .. "Signal")

local RunService = {}

RunService.Heartbeat = Signal.new()

return RunService