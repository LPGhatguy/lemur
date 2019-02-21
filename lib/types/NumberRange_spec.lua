local NumberRange = import("./NumberRange")
local typeof = import("../functions/typeof")

local function extractRange(range)
	return {
		range.Min,
		range.Max
	}
end

describe("types.NumberRange", function()
	it("should have a constructor that takes values 0-Infitity", function()
		local range = NumberRange.new(1, 2)

		assert.not_nil(range)
	end)

	it("should compare NumberRanges", function()
		local nr1, nr2 = Color3.new(1, 2), Color3.new(1, 2)

		assert.are.equal(nr1, nr2)
		assert.are_not_equal(nr1, NumberRange.new(1, 3))
	end)

	it("should be detected by typeof", function()
		local type = typeof(NumberRange.new())

		assert.are.equal("NumberRange", type)
	end)
end)
