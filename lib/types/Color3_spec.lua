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
	end)

	it("should have a constructor that takes rgb values 0-1", function()
		local color = Color3.new(0, 0, 0)

		assert.not_nil(color)
	end)

	it("should have the fromRGB method", function()
		local color = Color3.fromRGB(255, 0, 0)

		assert.are.same(extractColors(color), { 1, 0, 0 })
	end)
end)