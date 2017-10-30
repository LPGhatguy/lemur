local Instance = import("../Instance")

describe("instances.Game", function()
	it("should instantiate", function()
		local folder = Instance.new("Game")

		assert.not_nil(folder)
	end)
end)