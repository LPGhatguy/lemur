local Instance = import("../Instance")

describe("instances.TextService", function()
	it("should instantiate", function()
		local instance = Instance.new("TextService")

		assert.not_nil(instance)
	end)
end)