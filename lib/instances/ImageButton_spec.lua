local Instance = import("../Instance")
local typeof = import("../functions/typeof")

describe("instances.ImageButton", function()
	it("should instantiate", function()
		local instance = Instance.new("ImageButton")

		assert.not_nil(instance)
	end)

	it("should have properties defined", function()
		local instance = Instance.new("ImageButton")
		assert(typeof(instance.Image), "string")
		assert(typeof(instance.ScaleType), "number")
		assert(typeof(instance.SliceCenter), "Rect")
	end)
end)
