local Enum = import("../Enum")
local GuiObject = import("./GuiObject")
local InstanceProperty = import("../InstanceProperty")
local Vector2 = import("../types/Vector2")
local UDim2 = import("../types/UDim2")

local ScrollingFrame = GuiObject:extend("ScrollingFrame")

ScrollingFrame.properties.AbsoluteWindowSize = InstanceProperty.readOnly({
	get = function(self)
		local size = self.AbsoluteSize

		if size.X == 0 and size.Y == 0 then
			return size
		end

		local thickness = self.ScrollBarThickness
		local marginX = 0
		local marginY = 0

		if self._canScrollHorizontal then
			marginX = thickness
		end

		if self._canScrollVertical then
			marginY = thickness
		end

		return Vector2.new(
			size.X - marginX,
			size.Y - marginY
		)
	end,
})

ScrollingFrame.properties.CanvasSize = InstanceProperty.typed("UDim2", {
	getDefault = function()
		return UDim2.new()
	end,
})

ScrollingFrame.properties.ScrollBarThickness = InstanceProperty.typed("number", {
	getDefault = function()
		return 12
	end,
})

ScrollingFrame.properties.ScrollingDirection = InstanceProperty.typed("number", {
	getDefault = function()
		return Enum.ScrollingDirection.XY
	end,
})

ScrollingFrame.properties.ScrollingEnabled = InstanceProperty.typed("boolean", {
	getDefault = function()
		return true
	end,
})

function ScrollingFrame.prototype:_canScrollHorizontal()
	local scrollDir = self.ScrollingDirection
	return self.ScrollingEnabled and
		(scrollDir == Enum.ScrollingDirection.X or
		scrollDir == Enum.ScrollingDirection.XY)
end

function ScrollingFrame.prototype:_canScrollVertical()
	local scrollDir = self.ScrollingDirection
	return self.ScrollingEnabled and
		(scrollDir == Enum.ScrollingDirection.Y or
		scrollDir == Enum.ScrollingDirection.XY)
end

return ScrollingFrame