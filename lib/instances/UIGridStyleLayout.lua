local Enum = import("../Enum")
local BaseInstance = import("./BaseInstance")
local InstanceProperty = import("../InstanceProperty")
local UIGridStyleLayout = BaseInstance:extend("UIGridStyleLayout")

UIGridStyleLayout.properties.HorizontalAlignment = InstanceProperty.typed("number", {
	getDefault = function()
		return Enum.HorizontalAlignment.Center
	end,
})

UIGridStyleLayout.properties.SortOrder = InstanceProperty.typed("number", {
	getDefault = function()
		return Enum.SortOrder.Name
	end,
})

UIGridStyleLayout.properties.VerticalAlignment = InstanceProperty.typed("number", {
	getDefault = function()
		return Enum.VerticalAlignment.Center
	end,
})

return UIGridStyleLayout