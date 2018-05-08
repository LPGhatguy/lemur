local Player = import("./Player")

describe("instances.Player", function()
	it("should instantiate", function()
		local instance = Player:new()

		assert.not_nil(instance)
	end)
end)