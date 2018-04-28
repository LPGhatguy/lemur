local Instance = import("../Instance")

describe("instances.LocalizationService", function()
	it("should instantiate", function()
		local instance = Instance.new("LocalizationService")

		assert.not_nil(instance)
	end)
end)