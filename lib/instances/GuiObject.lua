local BaseInstance = import("./BaseInstance")
local Color3 = import("../types/Color3")
local Enum = import("../Enum")
local InstanceProperty = import("../InstanceProperty")
local Signal = import("../Signal")
local UDim2 = import("../types/UDim2")
local Vector2 = import("../types/Vector2")
local GuiObject = BaseInstance:extend("GuiObject")

local function isChildOfScreenGui(instance)
	while instance ~= nil do
		if instance.ClassName == "ScreenGui" then
			return true
		end

		instance = instance.Parent
	end

	return false
end

GuiObject.properties.AbsoluteSize = InstanceProperty.readOnly({
	get = function(self)
		if not isChildOfScreenGui(self) then
			return Vector2.new()
		end

		local size = self.Size
		local scaleX, scaleY = 0, 0

		if self.Parent ~= nil and (self.Parent:IsA("GuiObject") or self.Parent:IsA("ScreenGui")) then
			local parentSize = self.Parent.AbsoluteSize
			scaleX = parentSize.X
			scaleY = parentSize.Y
		end

		return Vector2.new(
			scaleX * size.X.Scale + size.X.Offset,
			scaleY * size.Y.Scale + size.Y.Offset
		)
	end,
})

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