local Color3 = import("../types/Color3")
local Enum = import("../Enum")
local GuiObject = import("./GuiObject")
local InstanceProperty = import("../InstanceProperty")
local Rect = import("../types/Rect")
local ImageLabel = GuiObject:extend("ImageLabel")

ImageLabel.properties.Image = InstanceProperty.typed("string", {
	getDefault = function()
		return ""
	end,
})

ImageLabel.properties.ImageColor3 = InstanceProperty.typed("Color3", {
	getDefault = function()
		return Color3.new()
	end,
})

ImageLabel.properties.ScaleType = InstanceProperty.typed("number", {
	getDefault = function()
		return Enum.ScaleType.Stretch
	end,
})

ImageLabel.properties.SliceCenter = InstanceProperty.typed("Rect", {
	getDefault = function()
		return Rect.new(0, 0, 1, 1)
	end,
})

return ImageLabel