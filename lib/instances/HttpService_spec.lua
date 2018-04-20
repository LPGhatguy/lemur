local Instance = import("../Instance")

describe("instances.HttpService", function()
	it("should instantiate", function()
		local instance = Instance.new("HttpService")

		assert.not_nil(instance)
	end)
end)