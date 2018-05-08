local Instance = import("../Instance")
local typeof = import("../functions/typeof")

describe("instances.UIListLayout", function()
	it("should instantiate", function()
		local instance = Instance.new("UIListLayout")

		assert.not_nil(instance)
	end)

	it("should have properties defined", function()
		local instance = Instance.new("UIListLayout")
		assert(typeof(instance.Padding), "UDim")
		assert(typeof(instance.SortOrder), 0)
	end)
end)