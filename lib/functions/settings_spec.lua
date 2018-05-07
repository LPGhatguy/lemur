local settings = import("./settings")
local typeof = import("./typeof")

describe("functions.settings", function()
	it("should be a function", function()
		assert.is_function(settings)
	end)

	it("should return an object", function()
		local instance = settings()
		assert.equals(type(instance), "userdata")
	end)

	it("should always return the same object", function()
		local instance = settings()
		local instance2 = settings()
		assert.equals(instance, instance2)
	end)

	it("should return false for fast flags", function()
		local instance = settings()
		assert.equals(instance:GetFFlag("FFTest"), false)
		assert.equals(instance:GetFFlag("FFTest2"), false)
		assert.equals(instance:GetFFlag("FFDoesSomethingHappen"), false)
	end)

	it("should have a property Rendering", function()
		local instance = settings()
		local renderSettings = instance.Rendering

		assert.not_nil(renderSettings)
		assert.equals(typeof(renderSettings), "RenderSettings")
	end)

	it("should not allow me to set the Rendering property", function()
		local instance = settings()
		assert.has.errors(function()
			instance.Rendering = true
		end)
	end)

	it("should not allow me to access undefined properties", function()
		local instance = settings()
		assert.has.errors(function()
			tostring(instance.thisDoesNotExist)
		end)
	end)

	it("should not allow me to set undefined properties", function()
		local instance = settings()
		assert.has.errors(function()
			instance.thisDoesNotExist = "this should throw"
		end)
	end)
end)