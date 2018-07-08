local createSpawn = import("./spawn")
local TaskScheduler = import("../TaskScheduler")

describe("taskFunctions.spawn", function()
	it("should schedule after a small amount of time", function()
		local scheduler = TaskScheduler.new()
		local spawn = createSpawn(scheduler)

		local count = 0

		spawn(function()
			count = count + 1
		end)

		assert.equal(count, 0)

		scheduler:step(0.2)

		assert.equal(count, 1)
	end)
end)