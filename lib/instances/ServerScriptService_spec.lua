local ServerScriptService = import("./ServerScriptService")
local lemur = require("lib")

describe("instances.ServerScriptService", function()
	it("should instantiate", function()
		local instance = ServerScriptService:new()
		
		assert.not_nil(instance)
	end)

	it("should not error when using loadstring if LoadStringEnabled is true", function()
		local habitat = lemur.Habitat:new()

		habitat.game:GetService("ServerScriptService").LoadStringEnabled = true

		assert.has.no.errors(function()
			habitat:loadstring("do end")
		end)
	end)

	it("should error when using loadstring if LoadStringEnabled is false", function()
		local habitat = lemur.Habitat:new()

		habitat.game:GetService("ServerScriptService").LoadStringEnabled = false

		assert.has.errors(function()
			habitat:loadstring("do end")
		end)
	end)
end)
