local Instance = import("../Instance")

describe("instances.ContentProvider", function()
	it("should instantiate", function()
		local instance = Instance.new("ContentProvider")

		assert.not_nil(instance)
	end)

	it("should have a string property BaseUrl", function()
		local instance = Instance.new("ContentProvider")

		assert.equals(type(instance.BaseUrl), "string")
	end)
end)