local Instance = import("../Instance")

describe("instances.GuiService", function()
	it("should instantiate", function()
		local instance = Instance.new("GuiService")

		assert.not_nil(instance)
	end)
end)