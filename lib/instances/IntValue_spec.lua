local Instance = import("../Instance")

describe("instances.IntValue", function()
	it("should instantiate", function()
		local instance = Instance.new("IntValue")

		assert.not_nil(instance)
		assert.equal(instance.Name, "Value")
		assert.equal(instance.Value, 0)
	end)
end)