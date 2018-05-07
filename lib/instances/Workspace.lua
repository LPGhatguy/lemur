local BaseInstance = import("./BaseInstance")
local Camera = import("./Camera")
local InstanceProperty = import("../InstanceProperty")
local Workspace = BaseInstance:extend("Workspace")

function Workspace:init(instance)
	local camera = Camera:new()
	camera.Name = "Camera"
	camera.Parent = instance
end

Workspace.properties.CurrentCamera = InstanceProperty.normal({
	getDefault = function(self)
		return self:FindFirstChild("Camera")
	end,
})

return Workspace

