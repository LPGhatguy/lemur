local Instance = import("../Instance")
local typeof = import("../functions/typeof")

describe("instances.Players", function()
	it("should instantiate", function()
		local instance = Instance.new("Players")

		assert.not_nil(instance)
	end)

	it("should have properties defined", function()
		local instance = Instance.new("Players")

		assert.equal(typeof(instance.LocalPlayer), "Instance")
	end)
end)
