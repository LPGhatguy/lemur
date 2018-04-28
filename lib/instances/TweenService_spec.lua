local Instance = import("../Instance")

describe("instances.TweenService", function()
	it("should instantiate", function()
		local instance = Instance.new("TweenService")

		assert.not_nil(instance)
	end)
end)