local Instance = import("../Instance")
local typeof = import("../functions/typeof")

describe("instances.ImageLabel", function()
	it("should instantiate", function()
		local instance = Instance.new("ImageLabel")

		assert.not_nil(instance)
	end)

	it("should have properties defined", function()
		local instance = Instance.new("ImageLabel")
		assert.equals(typeof(instance.Image), "string")
		assert.equals(typeof(instance.ImageColor3), "Color3")
		assert.equals(typeof(instance.ScaleType), "number")
		assert.equals(typeof(instance.SliceCenter), "Rect")
	end)
end)
