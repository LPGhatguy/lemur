local spawn = import("./spawn")

describe("functions.spawn", function()
	it("does nothing", function()
		local callCount = 0

		spawn(function()
			callCount = callCount + 1
		end)

		assert.equal(callCount, 0)
	end)
end)