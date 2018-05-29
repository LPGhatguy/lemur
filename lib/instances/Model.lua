local BaseInstance = import("./BaseInstance")
local InstanceProperty = import("../InstanceProperty")
local BasePart = import("./BasePart")

BaseInstance.properties.PrimaryPart = InstanceProperty.normal({
	getDefault = function()
		return BasePart:new()
	end,
})

return BaseInstance:extend("Model")