local Instance = import("../Instance")

describe("instances.BoolValue", function()
	it("should instantiate", function()
		local instance = Instance.new("BoolValue")

		assert.not_nil(instance)
		assert.equal(instance.Name, "Value")
		assert.equal(instance.Value, false)
	end)
end)