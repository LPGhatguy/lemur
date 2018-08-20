local Color3 = import("../types/Color3")
local Enum = import("../Enum")
local Font = import("../Enum/Font")
local GuiButton = import("./GuiButton")
local InstanceProperty = import("../InstanceProperty")

local TextButton = GuiButton:extend("TextButton", {
	creatable = true,
})

TextButton.properties.Font = InstanceProperty.enum(Font, {
	getDefault = function()
		return Font.Legacy
	end,
})

TextButton.properties.Text = InstanceProperty.typed("string", {
	getDefault = function()
		return "Button"
	end,
})

TextButton.properties.TextColor3 = InstanceProperty.typed("Color3", {
	getDefault = function()
		return Color3.new(27, 42, 53)
	end,
})

TextButton.properties.TextSize = InstanceProperty.typed("number", {
	getDefault = function()
		return 14
	end,
})

TextButton.properties.TextWrapped = InstanceProperty.typed("boolean", {
	getDefault = function()
		return false
	end,
})

TextButton.properties.TextXAlignment = InstanceProperty.typed("number", {
	getDefault = function()
		return Enum.TextXAlignment.Left
	end,
})

TextButton.properties.TextYAlignment = InstanceProperty.typed("number", {
	getDefault = function()
		return Enum.TextYAlignment.Top
	end,
})

return TextButton
