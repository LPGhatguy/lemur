local Enum = import("../Enum")
local Instance = import("../Instance")
local UDim2 = import("../types/UDim2")
local typeof = import("../functions/typeof")

local function extractVector2(vector2)
	return { vector2.X, vector2.Y }
end

describe("instances.ScrollingFrame", function()
	it("should instantiate", function()
		local instance = Instance.new("ScrollingFrame")
		assert.not_nil(instance)
	end)

	it("should have properties defined", function()
		local instance = Instance.new("ScrollingFrame")

		assert.equal(typeof(instance.CanvasSize), "UDim2")
		assert.equal(typeof(instance.ScrollBarThickness), "number")
		assert.equal(typeof(instance.ScrollingDirection), "number")
		assert.equal(typeof(instance.ScrollingEnabled), "boolean")
	end)

	describe("AbsoluteWindowSize", function()
		it("it should be affected by scrolling", function()
			local screenGui = Instance.new("ScreenGui")
			local screenGuiSize = screenGui.AbsoluteSize

			local instance = Instance.new("ScrollingFrame", screenGui)
			instance.Size = UDim2.new(1, 0, 1, 0)

			instance.ScrollingEnabled = false
			assert.same(extractVector2(screenGuiSize), extractVector2(instance.AbsoluteWindowSize))

			instance.ScrollingEnabled = true
			instance.ScrollingDirection = Enum.ScrollingDirection.XY
			assert.same(
				{
					screenGuiSize.X - instance.ScrollBarThickness,
					screenGuiSize.Y - instance.ScrollBarThickness,
				},
				extractVector2(instance.AbsoluteWindowSize)
			)

			instance.ScrollingDirection = Enum.ScrollingDirection.X
			instance.ScrollingEnabled = true
			assert.same(
				{
					screenGuiSize.X - instance.ScrollBarThickness,
					screenGuiSize.Y,
				},
				extractVector2(instance.AbsoluteWindowSize)
			)

			instance.ScrollingDirection = Enum.ScrollingDirection.Y
			instance.ScrollingEnabled = true
			assert.same(
				{
					screenGuiSize.X,
					screenGuiSize.Y - instance.ScrollBarThickness,
				},
				extractVector2(instance.AbsoluteWindowSize)
			)
		end)
	end)
end)
