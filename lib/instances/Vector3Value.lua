local BaseInstance = import("./BaseInstance")
local InstanceProperty = import("../InstanceProperty")
local Vector3 = import("../types/Vector3")

local Vector3Value = BaseInstance:extend("Vector3Value")

Vector3Value.properties.Value = InstanceProperty.normal({
	getDefault = function()
		return Vector3.new(0,0,0)
	end,
})

function Vector3Value:init(instance)
	instance.Name = "Value"
end

return Vector3Value