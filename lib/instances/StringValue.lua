local BaseInstance = import("./BaseInstance")
local InstanceProperty = import("../InstanceProperty")

local StringValue = BaseInstance:extend("StringValue")

StringValue.properties.Value = InstanceProperty.normal({
	getDefault = function()
		return ""
	end,
})

function StringValue:init(instance)
	instance.Name = "Value"
end

return StringValue