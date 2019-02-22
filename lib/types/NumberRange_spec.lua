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
		assert.are.same(extractRange(range), { 1, 2 })
	end)

	it("should have a constructor that takes one value", function()
		local range = NumberRange.new(1)

		assert.not_nil(range)
		assert.are.same(extractRange(range), { 1, 1 })
	end)

	it("should throw when bad params are passed to the 2-param constructor", function()
		assert.has.errors(function()
			NumberRange.new("test", 1)
		end)

		assert.has.errors(function()
			NumberRange.new(1, "test")
		end)
	end)

	it("should compare NumberRanges", function()
		local nr1, nr2 = NumberRange.new(1, 2), NumberRange.new(1, 2)

		assert.are.equal(nr1, nr2)
		assert.are_not_equal(nr1, NumberRange.new(1, 3))
	end)

	it("should be detected by typeof", function()
		local type = typeof(NumberRange.new(1, 2))

		assert.are.equal("NumberRange", type)
	end)

	it("should be \"NumberRange\" when tostringed", function()
		local tostringed = tostring(NumberRange)

		assert.are.equal("NumberRange", tostringed)
	end)

	it("should throw when bad indexing", function()
		assert.has.errors(function()
			NumberRange["Bad"]()
		end)

		assert.has.errors(function()
			NumberRange.new(1, 2)["Bad"]()
		end)
	end)
end)
