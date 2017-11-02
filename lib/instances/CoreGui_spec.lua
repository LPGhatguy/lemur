local Instance = import("../Instance")

describe("instances.CoreGui", function()
	it("should instantiate", function()
		local instance = Instance.new("CoreGui")

		assert.not_nil(instance)
	end)
end)