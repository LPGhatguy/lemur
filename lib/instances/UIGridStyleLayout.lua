local BaseInstance = import("./BaseInstance")
local FillDirection = import("../Enum/FillDirection")
local HorizontalAlignment = import("../Enum/HorizontalAlignment")
local InstanceProperty = import("../InstanceProperty")
local SortOrder = import("../Enum/SortOrder")
local VerticalAlignment = import("../Enum/VerticalAlignment")

local UIGridStyleLayout = BaseInstance:extend("UIGridStyleLayout")

UIGridStyleLayout.properties.FillDirection = InstanceProperty.enum(FillDirection, {
	getDefault = function()
		return FillDirection.Horizontal
	end,
})

UIGridStyleLayout.properties.HorizontalAlignment = InstanceProperty.enum(HorizontalAlignment, {
	getDefault = function()
		return HorizontalAlignment.Center
	end,
})

UIGridStyleLayout.properties.SortOrder = InstanceProperty.enum(SortOrder, {
	getDefault = function()
		return SortOrder.Name
	end,
})

UIGridStyleLayout.properties.VerticalAlignment = InstanceProperty.enum(VerticalAlignment, {
	getDefault = function()
		return VerticalAlignment.Center
	end,
})

return UIGridStyleLayout