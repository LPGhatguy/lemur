local Instance = import("../Instance")

describe("instances.Game", function()
	it("should instantiate", function()
		local instance = Instance.new("Game")

		assert.not_nil(instance)
	end)
end)