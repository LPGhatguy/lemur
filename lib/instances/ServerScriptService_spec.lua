local ServerScriptService = import("./ServerScriptService")
local lemur = require("lib")

describe("instances.ServerScriptService", function()
	it("should instantiate", function()
		local instance = ServerScriptService:new()

		assert.not_nil(instance)
	end)
end)
