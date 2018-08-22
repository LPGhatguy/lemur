local createDelay = import("./delay")
local TaskScheduler = import("../TaskScheduler")

describe("taskFunctions.delay", function()
	it("should schedule after a small amount of time", function()
		local scheduler = TaskScheduler.new()
		local delay = createDelay(scheduler)

		local spy = spy.new(function() end)
		delay(0, function() spy() end)
		scheduler:step(0.2)
		assert.spy(spy).was_called()
	end)

	it("should not call the function until after the delay", function()
		local scheduler = TaskScheduler.new()
		local delay = createDelay(scheduler)

		local spy = spy.new(function() end)
		delay(1, function() spy() end)
		scheduler:step(0.2)
		assert.spy(spy).was_not_called()
	end)
end)