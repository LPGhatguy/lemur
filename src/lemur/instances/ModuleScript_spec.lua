local Instance = import("../Instance")

describe("instances.ModuleScript", function()
	it("should instantiate", function()
		local folder = Instance.new("ModuleScript")

		assert.not_nil(folder)
	end)
end)