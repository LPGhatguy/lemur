local SettingsGenerator = import("./settings")
local typeof = import("./typeof")

describe("functions.settings", function()
	it("should be a function", function()
		assert.is_function(SettingsGenerator)
	end)

	it("should return the actual settings() function", function()
		local settings = SettingsGenerator({})
		local instance = settings()
		assert.equals(type(instance), "userdata")
	end)

	it("should always return the same object", function()
		local settings = SettingsGenerator({})

		local instance = settings()
		local instance2 = settings()
		assert.equals(instance, instance2)
	end)

	it("should accept fast flags", function()
		local settings = SettingsGenerator({
			FFTest = true,
			FFTest2 = true,
			FFDoesSomethingHappen = false,
		})

		local instance = settings()
		assert.equals(instance:GetFFlag("FFTest"), false)
		assert.equals(instance:GetFFlag("FFTest2"), false)
		assert.equals(instance:GetFFlag("FFDoesSomethingHappen"), false)
		assert.equals(instance:GetFFlag("FFUndefinedFastFlag"), false)
	end)

	it("should have a property Rendering", function()
		local settings = SettingsGenerator({})

		local instance = settings()
		local renderSettings = instance.Rendering

		assert.not_nil(renderSettings)
		assert.equals(typeof(renderSettings), "RenderSettings")
	end)

	it("should not allow me to set the Rendering property", function()
		local settings = SettingsGenerator({})

		local instance = settings()
		assert.has.errors(function()
			instance.Rendering = true
		end)
	end)

	it("should not allow me to access undefined properties", function()
		local settings = SettingsGenerator({})

		local instance = settings()
		assert.has.errors(function()
			tostring(instance.thisDoesNotExist)
		end)
	end)

	it("should not allow me to set undefined properties", function()
		local settings = SettingsGenerator({})

		local instance = settings()
		assert.has.errors(function()
			instance.thisDoesNotExist = "this should throw"
		end)
	end)
end)