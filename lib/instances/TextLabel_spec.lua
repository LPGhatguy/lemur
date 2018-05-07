local Instance = import("../Instance")
local typeof = import("../functions/typeof")

describe("instances.TextLabel", function()
	it("should instantiate", function()
		local instance = Instance.new("TextLabel")

		assert.not_nil(instance)
	end)

	it("should have properties defined", function()
		local instance = Instance.new("TextLabel")
		assert(typeof(instance.Font), "number")
		assert(typeof(instance.Text), "string")
		assert(typeof(instance.TextColor3), "Color3")
		assert(typeof(instance.TextSize), "number")
		assert(typeof(instance.TextWrap), "boolean")
		assert(typeof(instance.TextXAlignment), "number")
		assert(typeof(instance.TextYAlignment), "number")
	end)
end)