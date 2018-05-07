local Instance = import("../Instance")

describe("instances.Stats", function()
	it("should instantiate", function()
		local instance = Instance.new("Stats")

		assert.not_nil(instance)
	end)
end)