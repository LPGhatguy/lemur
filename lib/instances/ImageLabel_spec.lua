local Instance = import("../Instance")
local typeof = import("../functions/typeof")

describe("instances.ImageLabel", function()
	it("should instantiate", function()
		local instance = Instance.new("ImageLabel")

		assert.not_nil(instance)
	end)

	it("should have properties defined", function()
		local instance = Instance.new("ImageLabel")
		assert(typeof(instance.Image), "string")
		assert(typeof(instance.ScaleType), "number")
		assert(typeof(instance.SliceCenter), "Rect")
	end)
end)
