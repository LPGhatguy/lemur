local UIGridStyleLayout = import("./UIGridStyleLayout")
local InstanceProperty = import("../InstanceProperty")
local UDim = import("../types/UDim")
local Vector2 = import("../types/Vector2")

local UIListLayout = UIGridStyleLayout:extend("UIListLayout", {
	creatable = true,
})

UIListLayout.properties.Padding = InstanceProperty.typed("UDim", {
	getDefault = function()
		return UDim.new()
	end,
})

UIListLayout.properties.AbsoluteContentSize = InstanceProperty.readOnly({
	get = function(self)
		if self:FindFirstAncestorOfClass("ScreenGui") == nil then
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

return UIListLayout