local Instance = import("../Instance")

describe("instances.ReplicatedStorage", function()
	it("should instantiate", function()
		local instance = Instance.new("ReplicatedStorage")

		assert.not_nil(instance)
	end)
end)