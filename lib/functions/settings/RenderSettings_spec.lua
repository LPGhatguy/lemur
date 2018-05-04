local RenderSettings = import("./RenderSettings")
local typeof = import("../typeof")

describe("functions.settings.RenderSettings", function()
	it("should be an object", function()
		local instance = RenderSettings.new()
		assert.not_nil(instance)
		assert.equals(type(instance), "userdata")
	end)

	it("should be of type RenderSettings", function()
		local instance = RenderSettings.new()
		assert.equals(typeof(instance), "RenderSettings")
	end)

	it("should have a property QualityLevel", function()
		local instance = RenderSettings.new()
		assert.equals(instance.QualityLevel, 0)

		instance.QualityLevel = 1
		assert.equals(instance.QualityLevel, 1)
	end)
end)