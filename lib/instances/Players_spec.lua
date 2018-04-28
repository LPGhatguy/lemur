local Instance = import("../Instance")

describe("instances.Players", function()
	it("should instantiate", function()
		local instance = Instance.new("Players")

		assert.not_nil(instance)
	end)
end)