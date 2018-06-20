local Camera = import("./Camera")
local typeof = import("../functions/typeof")

describe("instances.Camera", function()
	it("should instantiate", function()
		local instance = Camera:new()

		assert.not_nil(instance)
	end)

	it("should have properties defined", function()
		local instance = Camera:new()
		assert.equal(typeof(instance.ViewportSize), "Vector2")
	end)
end)