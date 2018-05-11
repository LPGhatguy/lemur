local GuiObject = import("./GuiObject")
local ScreenGui = import("./ScreenGui")
local UDim2 = import("../types/UDim2")
local typeof = import("../functions/typeof")

local function extractVector2(v)
	return { v.X, v.Y }
end

describe("instances.GuiObject", function()
	it("should instantiate", function()
		local instance = GuiObject:new()

		assert.not_nil(instance)
	end)

	it("should have properties defined", function()
		local instance = GuiObject:new()

		assert(typeof(instance.Active), "boolean")
		assert(typeof(instance.AnchorPoint), "Vector2")
		assert(typeof(instance.BackgroundColor3), "Color3")
		assert(typeof(instance.BackgroundTransparency), "number")
		assert(typeof(instance.BorderSizePixel), "number")
		assert(typeof(instance.ClipsDescendants), "boolean")
		assert(typeof(instance.InputBegan), "Signal")
		assert(typeof(instance.InputEnded), "Signal")
		assert(typeof(instance.LayoutOrder), "number")
		assert(typeof(instance.Position), "UDim2")
		assert(typeof(instance.Size), "UDim2")
		assert(typeof(instance.SizeConstraint), "number")
		assert(typeof(instance.Visible), "boolean")
	end)

	describe("AbsoluteSize", function()
		it("should return (0, 0) when it is not a child of ScreenGui", function()
			local parent = GuiObject:new()
			parent.Size = UDim2.new(0, 320, 0, 240)

			local child = GuiObject:new()
			child.Size = UDim2.new(0.5, 20, 0.5, 20)
			child.Parent = parent

			assert.are.same(extractVector2(parent.AbsoluteSize), {0, 0})
			assert.are.same(extractVector2(child.AbsoluteSize), {0, 0})
		end)

		it("should propagate size from a ScreenGui", function()
			local screenGui = ScreenGui:new()
			local screenGuiSize = screenGui.AbsoluteSize

			local parent = GuiObject:new()
			parent.Parent = screenGui
			parent.Size = UDim2.new(0.5, 100, 0.1, 200)

			local parentAbsoluteSize = parent.AbsoluteSize
			assert.are.same(
				extractVector2(parentAbsoluteSize),
				{
					0.5 * screenGuiSize.X + 100,
					0.1 * screenGuiSize.Y + 200,
				}
			)

			local child = GuiObject:new()
			child.Parent = parent
			child.Size = UDim2.new(2, 50, 4, 10)

			local childAbsoluteSize = child.AbsoluteSize
			assert.are.same(
				extractVector2(childAbsoluteSize),
				{
					2 * parentAbsoluteSize.X + 50,
					4 * parentAbsoluteSize.Y + 10,
				}
			)
		end)
	end)
end)
