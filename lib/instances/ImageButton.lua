local Enum = import("../Enum")
local GuiButton = import("./GuiButton")
local InstanceProperty = import("../InstanceProperty")
local Rect = import("../types/Rect")
local ImageButton = GuiButton:extend("ImageButton")

ImageButton.properties.Image = InstanceProperty.typed("string", {
	getDefault = function()
		return ""
	end,
})

ImageButton.properties.ScaleType = InstanceProperty.typed("number", {
	getDefault = function()
		return Enum.ScaleType.Stretch
	end,
})

ImageButton.properties.SliceCenter = InstanceProperty.typed("Rect", {
	getDefault = function()
		return Rect.new(0, 0, 1, 1)
	end,
})

return ImageButton