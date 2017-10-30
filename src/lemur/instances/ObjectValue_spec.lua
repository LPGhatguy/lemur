local Instance = import("../Instance")

describe("instances.ObjectValue", function()
	it("should instantiate", function()
		local instance = Instance.new("ObjectValue")

		assert.not_nil(instance)
		assert.equal(instance.Name, "Value")
		assert.equal(instance.Value, nil)
	end)
end)