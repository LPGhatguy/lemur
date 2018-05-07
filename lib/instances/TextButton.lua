local Color3 = import("../types/Color3")
local GuiButton = import("./GuiButton")
local InstanceProperty = import("../InstanceProperty")
local TextButton = GuiButton:extend("TextButton")

TextButton.properties.Text = InstanceProperty.normal({
	getDefault = function()
		return ""
	end,
})

TextButton.properties.TextColor3 = InstanceProperty.normal({
	getDefault = function()
		return Color3.new()
	end,
})

TextButton.properties.TextSize = InstanceProperty.normal({
	getDefault = function()
		return 12
	end,
})

return TextButton
