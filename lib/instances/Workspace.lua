local BaseInstance = import("./BaseInstance")
local Camera = import("./Camera")
local InstanceProperty = import("../InstanceProperty")
local Workspace = BaseInstance:extend("Workspace")

function Workspace:init(instance)
	local camera = Camera:new()
	camera.Name = "Camera"
	camera.Parent = instance
	instance.CurrentCamera = camera
end

Workspace.properties.CurrentCamera = InstanceProperty.normal({})

return Workspace