local Instance = import("../Instance")
local typeof = import("../functions/typeof")

describe("instances.GuiButton", function()
	it("should instantiate", function()
		local instance = Instance.new("GuiButton")

		assert.not_nil(instance)
	end)

	it("should have properties defined", function()
		local instance = Instance.new("GuiButton")
		assert.equal(typeof(instance.Activated), "RBXScriptSignal")
		assert.equal(typeof(instance.AutoButtonColor), "boolean")
		assert.equal(typeof(instance.MouseButton1Click), "RBXScriptSignal")
	end)
end)
