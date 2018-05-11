local UIListLayout = import("./UIListLayout")
local UDim = import("../types/UDim")

describe("instances.UIListLayout", function()
	it("should instantiate", function()
		local instance = UIListLayout:new()

		assert.not_nil(instance)
	end)

	it("should inherit from UIGridStyleLayout", function()
		local instance = UIListLayout:new()

		assert.True(instance:IsA("UIGridStyleLayout"))
	end)

	it("should have properties defined", function()
		local instance = UIListLayout:new()

		assert.equals(getmetatable(instance.Padding).type, UDim)
	end)
end)