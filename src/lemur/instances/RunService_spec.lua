local Instance = require("lemur.Instance")

describe("instances.RunService", function()
	it("should instantiate", function()
		local service = Instance.new("RunService")

		assert.not_nil(service)
		assert.not_nil(service.Heartbeat)
	end)
end)