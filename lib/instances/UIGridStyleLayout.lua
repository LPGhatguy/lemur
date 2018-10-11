local BaseInstance = import("./BaseInstance")
local FillDirection = import("../Enum/FillDirection")
local HorizontalAlignment = import("../Enum/HorizontalAlignment")
local InstanceProperty = import("../InstanceProperty")
local SortOrder = import("../Enum/SortOrder")
local Vector2 = import("../types/Vector2")
local VerticalAlignment = import("../Enum/VerticalAlignment")
local Vector2 = import("../types/Vector2")

local UIGridStyleLayout = BaseInstance:extend("UIGridStyleLayout")

UIGridStyleLayout.properties.AbsoluteContentSize = InstanceProperty.readOnly({
	get = function(self)
		local x = 0
		local y = 0
		if self:FindFirstAncestorWhichIsA("ScreenGui") then
			-- Sum the size of the children in the fill direction and get
			-- the maximum size of the children in the other direction.
			for _, child in pairs(self.Parent:GetChildren()) do
				if child:IsA("GuiObject") then
					if self.FillDirection == FillDirection.Horizontal then
						x = x + child.AbsoluteSize.X
						local childHeight = child.AbsoluteSize.Y
						if childHeight > y then
							y = childHeight
						end
					else
						y = y + child.AbsoluteSize.Y
						local childWidth = child.AbsoluteSize.X
						if childWidth > x then
							x = childWidth
						end
					end
				end
			end
		end
		return Vector2.new(x, y)
	end,
})

UIGridStyleLayout.properties.FillDirection = InstanceProperty.enum(FillDirection, {
	getDefault = function()
		return FillDirection.Horizontal
	end,
})

UIGridStyleLayout.properties.HorizontalAlignment = InstanceProperty.enum(HorizontalAlignment, {
	getDefault = function()
		return HorizontalAlignment.Center
	end,
})

UIGridStyleLayout.properties.SortOrder = InstanceProperty.enum(SortOrder, {
	getDefault = function()
		return SortOrder.Name
	end,
})

UIGridStyleLayout.properties.VerticalAlignment = InstanceProperty.enum(VerticalAlignment, {
	getDefault = function()
		return VerticalAlignment.Center
	end,
})

UIGridStyleLayout.properties.AbsoluteContentSize = InstanceProperty.readOnly({
	get = function(self)
		return Vector2.new(0, 0)
	end,
})

return UIGridStyleLayout