local Instance = import("../Instance")

describe("instances.CoreGui", function()
	it("should instantiate", function()
		local instance = Instance.new("CoreGui")

		assert.not_nil(instance)
	end)
	it("should have a settable RobloxGui property", function()
		local instance = Instance.new("CoreGui")
		local table = { test = 1234 }

		instance.RobloxGui = table
		assert.equals(instance.RobloxGui, table)
	end)
end)