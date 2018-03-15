local Instance = import("../Instance")

--TODO: Replace Instance.new("TestService") with game:GetService("TestService")

describe("instances.TestService", function()
	it("should instantiate", function()
		local instance = Instance.new("TestService")

		assert.not_nil(instance)
		assert.not_nil(instance.Error)
	end)
end)