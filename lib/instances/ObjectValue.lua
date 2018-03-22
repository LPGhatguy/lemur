local BaseInstance = import("./BaseInstance")
local InstanceProperty = import("../InstanceProperty")

local ObjectValue = BaseInstance:extend("ObjectValue")

ObjectValue.properties.Value = InstanceProperty.normal({})

function ObjectValue:init(instance)
	instance.Name = "Value"
end

return ObjectValue