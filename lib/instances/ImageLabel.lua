local GuiObject = import("./GuiObject")
local InstanceProperty = import("../InstanceProperty")
local Rect = import("../types/Rect")
local ImageLabel = GuiObject:extend("ImageLabel")

ImageLabel.properties.Image = InstanceProperty.normal({
	getDefault = function()
		return ""
	end,
})

ImageLabel.properties.ScaleType = InstanceProperty.normal({
	getDefault = function()
		return 0
	end,
})

ImageLabel.properties.SliceCenter = InstanceProperty.normal({
	getDefault = function()
		return Rect.new(0, 0, 1, 1)
	end,
})

return ImageLabel