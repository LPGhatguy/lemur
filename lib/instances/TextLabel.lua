local Color3 = import("../types/Color3")
local Enum = import("../Enum")
local GuiObject = import("./GuiObject")
local InstanceProperty = import("../InstanceProperty")
local TextLabel = GuiObject:extend("TextLabel")

TextLabel.properties.Font = InstanceProperty.typed("number", {
	getDefault = function()
		return Enum.Font.Legacy
	end,
})

TextLabel.properties.Text = InstanceProperty.typed("string", {
	getDefault = function()
		return "Label"
	end,
})

TextLabel.properties.TextColor3 = InstanceProperty.typed("Color3", {
	getDefault = function()
		return Color3.new(27, 42, 53)
	end,
})

TextLabel.properties.TextSize = InstanceProperty.typed("number", {
	getDefault = function()
		return 14
	end,
})

TextLabel.properties.TextWrapped = InstanceProperty.typed("boolean", {
	getDefault = function()
		return false
	end,
})

TextLabel.properties.TextXAlignment = InstanceProperty.typed("number", {
	getDefault = function()
		return Enum.TextXAlignment.Left
	end,
})

TextLabel.properties.TextYAlignment = InstanceProperty.typed("number", {
	getDefault = function()
		return Enum.TextYAlignment.Top
	end,
})

return TextLabel
