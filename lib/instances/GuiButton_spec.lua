local Instance = import("../Instance")
local typeof = import("../functions/typeof")

describe("instances.GuiButton", function()
	it("should instantiate", function()
		local instance = Instance.new("GuiButton")

		assert.not_nil(instance)
	end)

	it("should have properties defined", function()
		local instance = Instance.new("GuiButton")
		assert(typeof(instance.Activated), "Signal")
		assert(typeof(instance.AutoButtonColor), "boolean")
		assert(typeof(instance.MouseButton1Click), "Signal")
	end)
end)
