local spawn = import("./spawn")

describe("functions.spawn", function()
	it("does nothing", function()
		local testSpy = spy.new(function() end)

		spawn(testSpy)

		assert.spy(testSpy).was_not_called()
	end)
end)