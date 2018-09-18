local UIGridStyleLayout = import("./UIGridStyleLayout")
local FillDirection = import("../Enum/FillDirection")
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
		local size = UIGridStyleLayout.properties.AbsoluteContentSize.get(self)
		if self.Padding ~= UDim.new(0, 0) and self:FindFirstAncestorWhichIsA("ScreenGui") then
			local siblingCount = 0
			for _, child in pairs(self.Parent:GetChildren()) do
				if child:IsA("GuiObject") then
					siblingCount = siblingCount + 1
				end
			end
			if siblingCount > 0 then
				local function getPadding(parentSizeInFillDirection)
					return (siblingCount - 1) * (parentSizeInFillDirection * self.Padding.Scale + self.Padding.Offset)
				end
				local parentSize = self.Parent.AbsoluteSize
				local x = size.X
				local y = size.Y
				if self.FillDirection == FillDirection.Horizontal then
					x = x + getPadding(parentSize.X)
				else
					y = y + getPadding(parentSize.Y)
				end
				size = Vector2.new(x, y)
			end
		end
		return size
	end
})

return UIListLayout