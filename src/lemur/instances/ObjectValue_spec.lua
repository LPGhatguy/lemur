local Instance = import("../Instance")

describe("instances.ObjectValue", function()
	it("should instantiate", function()
		local instance = Instance.new("ObjectValue")

		assert.not_nil(instance)
		assert.equal(instance.Name, "Value")
		assert.equal(instance.Value, nil)
	end)

	it("should set values", function()
		local instance = Instance.new("ObjectValue")

		instance.Value = instance

		assert.equal(instance.Value, instance)
	end)
end)