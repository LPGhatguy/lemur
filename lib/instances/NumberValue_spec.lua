local Instance = import("../Instance")

describe("instances.NumberValue", function()
	it("should instantiate", function()
		local instance = Instance.new("NumberValue")

		assert.not_nil(instance)
		assert.equal("Value", instance.Name)
		assert.equal(0, instance.Value)
	end)
end)