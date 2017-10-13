local root = (...):match("^(.-%.)[^.]+%.[^.]+$")

local Signal = require("Signal")

local RunService = {}

RunService.Heartbeat = Signal.new()

return RunService