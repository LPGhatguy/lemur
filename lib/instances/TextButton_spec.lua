local Instance = import("../Instance")
local typeof = import("../functions/typeof")

describe("instances.TextButton", function()
	it("should instantiate", function()
		local instance = Instance.new("TextButton")

		assert.not_nil(instance)
	end)

	it("should have properties defined", function()
		local instance = Instance.new("TextButton")
		assert(typeof(instance.Text), "string")
		assert(typeof(instance.TextColor3), "Color3")
		assert(typeof(instance.TextSize), "number")
	end)
end)
