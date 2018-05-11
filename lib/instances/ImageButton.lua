local Color3 = import("../types/Color3")
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

ImageButton.properties.ImageColor3 = InstanceProperty.typed("Color3", {
	getDefault = function()
		return Color3.new()
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