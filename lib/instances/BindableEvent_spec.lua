local Instance = import("../Instance")

describe("instances.BindableEvent", function()
	it("should instantiate", function()
		local instance = Instance.new("BindableEvent")

		assert.not_nil(instance)
		assert.not_nil(instance.Event)
	end)

	it("should fire Event when fired", function()
		local instance = Instance.new("BindableEvent")

		local callCount = 0
		instance.Event:Connect(function()
			callCount = callCount + 1
		end)

		instance:Fire()

		assert.equal(callCount, 1)
	end)
end)