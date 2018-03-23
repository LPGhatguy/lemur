local Color3 = import("./Color3")

local function extractColors(color)
	return {
		color.r,
		color.g,
		color.b
	}
end

describe("types.Color3", function()
	it("should have an empty constructor", function()
		local color = Color3.new()

		assert.not_nil(color)
		assert.are.same({ 0, 0, 0 }, extractColors(color))
	end)

	it("should have a constructor that takes rgb values 0-1", function()
		local color = Color3.new(0, 0, 0)

		assert.not_nil(color)
	end)

	it("should have the fromRGB method", function()
		local color = Color3.fromRGB(255, 0, 0)

		assert.are.same({ 1, 0, 0 }, extractColors(color))
	end)

	it("should have the fromHSV method", function()
		local color = Color3.fromHSV(120 / 360, 0.5, 0.75)

		-- Round the colors to the nearest whole number
		-- This ensures we don't get errors from rounding, which are
		-- ultimately fairly unimportant.
		local r = math.floor(color.r * 255 + 0.5)
		local g = math.floor(color.g * 255 + 0.5)
		local b = math.floor(color.b * 255 + 0.5)

		assert.are.same({ 96, 191, 96 }, { r, g, b })
	end)
end)
