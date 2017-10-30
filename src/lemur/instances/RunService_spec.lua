local Instance = import("../Instance")

describe("instances.RunService", function()
	it("should instantiate", function()
		local instance = Instance.new("RunService")

		assert.not_nil(instance)
		assert.not_nil(instance.Heartbeat)
	end)
end)