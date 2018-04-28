local Instance = import("../Instance")

describe("instances.UserInputService", function()
	it("should instantiate", function()
		local instance = Instance.new("UserInputService")

		assert.not_nil(instance)
	end)
end)