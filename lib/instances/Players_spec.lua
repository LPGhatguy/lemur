local typeof = import("../functions/typeof")

local Players = import("./Players")

describe("instances.Players", function()
	it("should instantiate", function()
		local instance = Players:new()

		assert.not_nil(instance)
	end)

	it("should have properties defined", function()
		local instance = Players:new()

		assert.equal(typeof(instance.LocalPlayer), "Instance")
	end)
end)
