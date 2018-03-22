local Signal = import("../Signal")
local BaseInstance = import("./BaseInstance")
local InstanceProperty = import("../InstanceProperty")

local RunService = BaseInstance:extend("RunService")

RunService.properties.Heartbeat = InstanceProperty.readOnly({
	getDefault = Signal.new,
})

return RunService