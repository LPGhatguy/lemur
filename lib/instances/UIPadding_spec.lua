local Instance = import("../Instance")
local typeof = import("../functions/typeof")

describe("instances.UIPadding", function()
	it("should instantiate", function()
		local instance = Instance.new("UIPadding")

		assert.not_nil(instance)
	end)

	it("should have properties defined", function()
		local instance = Instance.new("UIPadding")
		assert(typeof(instance.PaddingBottom), "UDim")
		assert(typeof(instance.PaddingLeft), "UDim")
		assert(typeof(instance.PaddingRight), "UDim")
		assert(typeof(instance.PaddingTop), "UDim")
	end)
end)