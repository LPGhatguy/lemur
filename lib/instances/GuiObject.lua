local BaseInstance = import("./BaseInstance")
local Color3 = import("../types/Color3")
local Enum = import("../Enum")
local InstanceProperty = import("../InstanceProperty")
local Signal = import("../Signal")
local UDim2 = import("../types/UDim2")
local Vector2 = import("../types/Vector2")
local GuiObject = BaseInstance:extend("GuiObject")

GuiObject.properties.Active = InstanceProperty.typed("boolean", {
	getDefault = function()
		return true
	end,
})

GuiObject.properties.AnchorPoint = InstanceProperty.typed("Vector2", {
	getDefault = function()
		return Vector2.new()
	end,
})

GuiObject.properties.BackgroundColor3 = InstanceProperty.typed("Color3", {
	getDefault = function()
		return Color3.new()
	end,
})

GuiObject.properties.BackgroundTransparency = InstanceProperty.typed("number", {
	getDefault = function()
		return 0
	end,
})

GuiObject.properties.BorderSizePixel = InstanceProperty.typed("number", {
	getDefault = function()
		return 0
	end,
})

GuiObject.properties.ClipsDescendants = InstanceProperty.typed("boolean", {
	getDefault = function()
		return false
	end,
})

GuiObject.properties.InputBegan = InstanceProperty.readOnly({
	getDefault = function()
		return Signal.new()
	end,
})

GuiObject.properties.InputEnded = InstanceProperty.readOnly({
	getDefault = function()
		return Signal.new()
	end,
})

GuiObject.properties.LayoutOrder = InstanceProperty.typed("number", {
	getDefault = function()
		return 0
	end,
})

GuiObject.properties.Position = InstanceProperty.typed("UDim2", {
	getDefault = function()
		return UDim2.new()
	end,
})

GuiObject.properties.Size = InstanceProperty.typed("UDim2", {
	getDefault = function()
		return UDim2.new()
	end,
})

GuiObject.properties.SizeConstraint = InstanceProperty.typed("number", {
	getDefault = function()
		return Enum.SizeConstraint.RelativeXY
	end,
})

GuiObject.properties.Visible = InstanceProperty.typed("boolean", {
	getDefault = function()
		return true
	end,
})

return GuiObject