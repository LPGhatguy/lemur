local Instance = import("../Instance")

describe("instances.ScreenGui", function()
	it("should instantiate", function()
		local instance = Instance.new("ScreenGui")

		assert.not_nil(instance)
	end)
end)