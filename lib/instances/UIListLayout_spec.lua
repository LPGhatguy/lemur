local FillDirection = import("../Enum/FillDirection")
local Instance = import("../Instance")
local typeof = import("../functions/typeof")
local UDim = import("../types/UDim")
local UDim2 = import("../types/UDim2")

local function extractVector2(vector2)
	return { vector2.X, vector2.Y }
end

describe("instances.UIListLayout", function()
	it("should instantiate", function()
		local instance = Instance.new("UIListLayout")

		assert.not_nil(instance)
	end)

	it("should inherit from UIGridStyleLayout", function()
		local instance = Instance.new("UIListLayout")

		assert.True(instance:IsA("UIGridStyleLayout"))
	end)

	it("should have properties defined", function()
		local instance = Instance.new("UIListLayout")

		assert.equals(typeof(instance.Padding), "UDim")
	end)

	describe("AbsoluteContentSize", function()
		it("should include padding vertically", function()
			local screenGui = Instance.new("ScreenGui")

			local instance = Instance.new("UIListLayout")
			instance.Padding = UDim.new(0, 10)
			instance.FillDirection = FillDirection.Vertical
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

			assert.same({ 300, 1020 }, extractVector2(instance.AbsoluteContentSize))
		end)

		it("should include padding horizonally", function()
			local screenGui = Instance.new("ScreenGui")

			local instance = Instance.new("UIListLayout")
			instance.Padding = UDim.new(0, 10)
			instance.FillDirection = FillDirection.Horizontal
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

			assert.same({ 620, 500 }, extractVector2(instance.AbsoluteContentSize))
		end)
	end)
end)