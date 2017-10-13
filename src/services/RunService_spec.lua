local RunService = require("src.services.RunService")

describe("RunService", function()
	it("exists", function()
		assert.not_nil(RunService)
		assert.not_nil(RunService.Heartbeat)
		assert.not_nil(RunService.Heartbeat.Connect)
	end)
end)