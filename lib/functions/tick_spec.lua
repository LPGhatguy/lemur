local tick = import("./tick")

describe("functions.tick", function()
	it("returns a number", function()
		assert.is.number(tick())
	end)

	it("should declare a global for high performance timing", function()
		assert.is.not_nil(_G.__LEMUR_NO_HIGH_PERFORMANCE_TIMER__)
	end)
end)