local Instance = import("../Instance")

describe("instances.BindableEvent", function()
	it("should instantiate", function()
		local instance = Instance.new("BindableEvent")

		assert.not_nil(instance)
		assert.not_nil(instance.Event)
	end)
end)