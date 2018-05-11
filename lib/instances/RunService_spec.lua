local RunService = import("./RunService")
local typeof = import("../functions/typeof")

describe("instances.RunService", function()
	it("should instantiate", function()
		local instance = RunService:new()

		assert.not_nil(instance)
		assert.not_nil(instance.Heartbeat)
	end)

	it("should have the name 'Run Service'", function()
		local instance = RunService:new()
		assert.is_equal(instance.Name, "Run Service")
	end)

	it("should return false when IsStudio() is called", function()
		local instance = RunService:new()
		assert.is_equal(instance.IsStudio(), false)
	end)

	it("should have properties defined", function()
		local instance = RunService:new()
		assert(typeof(instance.Heartbeat), "Signal")
		assert(typeof(instance.RenderStepped), "Signal")
	end)
end)