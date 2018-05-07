local GuiButton = import("./GuiButton")
local InstanceProperty = import("../InstanceProperty")
local Rect = import("../types/Rect")
local ImageButton = GuiButton:extend("ImageButton")

ImageButton.properties.AutoButtonColor = InstanceProperty.typed("boolean", {
	getDefault = function()
		return false
	end,
})

ImageButton.properties.Image = InstanceProperty.normal({
	getDefault = function()
		return ""
	end,
})

ImageButton.properties.ScaleType = InstanceProperty.normal({
	getDefault = function()
		return 0
	end,
})

ImageButton.properties.SliceCenter = InstanceProperty.normal({
	getDefault = function()
		return Rect.new(0, 0, 1, 1)
	end,
})

return ImageButton