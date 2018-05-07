local BaseInstance = import("./BaseInstance")
local InstanceProperty = import("../InstanceProperty")
local UDim = import("../types/UDim")
local UIPadding = BaseInstance:extend("UIPadding")

UIPadding.properties.PaddingBottom = InstanceProperty.normal({
	getDefault = function()
		return UDim.new()
	end,
})

UIPadding.properties.PaddingLeft = InstanceProperty.normal({
	getDefault = function()
		return UDim.new()
	end,
})

UIPadding.properties.PaddingRight = InstanceProperty.normal({
	getDefault = function()
		return UDim.new()
	end,
})

UIPadding.properties.PaddingTop = InstanceProperty.normal({
	getDefault = function()
		return UDim.new()
	end,
})

return UIPadding