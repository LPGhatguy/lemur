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
		return "Label"
	end,
})

TextLabel.properties.TextColor3 = InstanceProperty.normal({
	getDefault = function()
		return Color3.new(27, 42, 53)
	end,
})

TextLabel.properties.TextSize = InstanceProperty.normal({
	getDefault = function()
		return 14
	end,
})

TextLabel.properties.TextWrapped = InstanceProperty.normal({
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
