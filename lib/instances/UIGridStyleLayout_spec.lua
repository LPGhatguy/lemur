local UIGridStyleLayout = import("./UIGridStyleLayout")
local typeof = import("../functions/typeof")

describe("instances.UIGridStyleLayout", function()
	it("should instantiate", function()
		local instance = UIGridStyleLayout:new()

		assert.not_nil(instance)
	end)

	it("should have properties defined", function()
		local instance = UIGridStyleLayout:new()

		assert.equals(typeof(instance.HorizontalAlignment), "number")
		assert.equals(typeof(instance.SortOrder), "number")
		assert.equals(typeof(instance.VerticalAlignment), "number")
	end)
end)