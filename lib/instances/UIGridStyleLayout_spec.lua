local FillDirection = import("../Enum/FillDirection")
local HorizontalAlignment = import("../Enum/HorizontalAlignment")
local Instance = import("../Instance")
local SortOrder = import("../Enum/SortOrder")
local typeof = import("../functions/typeof")
local UDim2 = import("../types/UDim2")
local VerticalAlignment = import("../Enum/VerticalAlignment")

local UIGridStyleLayout = import("./UIGridStyleLayout")

local function extractVector2(vector2)
	return { vector2.X, vector2.Y }
end

describe("instances.UIGridStyleLayout", function()
	it("should instantiate", function()
		local instance = UIGridStyleLayout:new()

		assert.not_nil(instance)
	end)

	it("should have properties defined", function()
		local instance = UIGridStyleLayout:new()

		assert.equals(typeof(instance.AbsoluteContentSize), "Vector2")
		assert.equals(typeof(instance.FillDirection), "EnumItem")
		assert.equals(instance.FillDirection.EnumType, FillDirection)
		assert.equals(typeof(instance.HorizontalAlignment), "EnumItem")
		assert.equals(instance.HorizontalAlignment.EnumType, HorizontalAlignment)
		assert.equals(typeof(instance.SortOrder), "EnumItem")
		assert.equals(instance.SortOrder.EnumType, SortOrder)
		assert.equals(typeof(instance.VerticalAlignment), "EnumItem")
		assert.equal(instance.VerticalAlignment.EnumType, VerticalAlignment)
		assert.equals(typeof(instance.AbsoluteContentSize), "Vector2")
	end)

	describe("AbsoluteContentSize", function()
		it("should change based on the sizes of the layout's siblings", function()
			local screenGui = Instance.new("ScreenGui")

			local instance = UIGridStyleLayout:new()
			instance.Parent = screenGui

			local frame1 = Instance.new("Frame")
			frame1.Size = UDim2.new(0, 300, 0, 400)
			frame1.Parent = screenGui

			local frame2 = Instance.new("Frame")
			frame2.Size = UDim2.new(0, 200, 0, 500)
			frame2.Parent = screenGui

			local frame3 = Instance.new("Frame")
			frame3.Size = UDim2.new(0, 100, 0, 100)
			frame3.Parent = screenGui

			assert.same({ 600, 500 }, extractVector2(instance.AbsoluteContentSize))
		end)
	end)
end)