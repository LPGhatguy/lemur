local Instance = import("../Instance")

describe("instances.Folder", function()
	it("should instantiate", function()
		local folder = Instance.new("Folder")

		assert.not_nil(folder)
	end)
end)