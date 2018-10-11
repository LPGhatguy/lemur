local StarterCharacterScripts = import("./StarterCharacterScripts")

describe("instances.StarterCharacterScripts", function()
	it("should instantiate", function()
		local instance = StarterCharacterScripts:new()

		assert.not_nil(instance)
	end)
end)
