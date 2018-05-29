local Signal = import("../Signal")
local BaseInstance = import("./BaseInstance")
local InstanceProperty = import("../InstanceProperty")

local BasePart = BaseInstance:extend("BasePart")

BasePart.properties.Anchored = InstanceProperty.typed("boolean", {
	getDefault = function()
		return false
	end
})

BasePart.properties.CanCollide = InstanceProperty.typed("boolean", {
	getDefault = function()
		return true
	end
})

BasePart.properties.Transparency = InstanceProperty.typed("number", {
	getDefault = function()
		return 0
	end
})

BasePart.properties.Touched = InstanceProperty.readOnly({
	getDefault = Signal.new
})

BasePart.properties.TouchEnded = InstanceProperty.readOnly({
	getDefault = Signal.new
})


return BasePart