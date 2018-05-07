local Color3 = import("../types/Color3")
local GuiObject = import("./GuiObject")
local InstanceProperty = import("../InstanceProperty")
local TextLabel = GuiObject:extend("TextLabel")

TextLabel.properties.Font = InstanceProperty.normal({
	getDefault = function()
		return 0
	end,
})

TextLabel.properties.Text = InstanceProperty.normal({
	getDefault = function()
		return ""
	end,
})

TextLabel.properties.TextColor3 = InstanceProperty.normal({
	getDefault = function()
		return Color3.new()
	end,
})

TextLabel.properties.TextSize = InstanceProperty.normal({
	getDefault = function()
		return 12
	end,
})

TextLabel.properties.TextWrap = InstanceProperty.normal({
	getDefault = function()
		return false
	end,
})

TextLabel.properties.TextXAlignment = InstanceProperty.normal({
	getDefault = function()
		return 0
	end,
})

TextLabel.properties.TextYAlignment = InstanceProperty.normal({
	getDefault = function()
		return 0
	end,
})

return TextLabel
