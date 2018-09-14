local Signal = import("../Signal")
local BaseInstance = import("./BaseInstance")
local InstanceProperty = import("../InstanceProperty")

local RunService = BaseInstance:extend("RunService")

function RunService:init(instance)
	instance.Name = "Run Service"
end

RunService.properties.Heartbeat = InstanceProperty.readOnly({
	getDefault = Signal.new,
})

RunService.properties.RenderStepped = InstanceProperty.readOnly({
	getDefault = Signal.new,
})

function RunService.prototype:IsStudio()
	return false
end

return RunService
