local UserSettings = import("./UserSettings")
local typeof = import("./typeof")

describe("functions.UserSettings", function()
	it("should be a function", function()
		assert.is_function(UserSettings)
	end)

	it("should return an object", function()
		local instance = UserSettings()
		assert.equals(type(instance), "userdata")
	end)

	it("should always return the same object", function()
		local instance = UserSettings()
		local instance2 = UserSettings()
		assert.equals(instance, instance2)
	end)

	it("should have a property GameSettings", function()
		local instance = UserSettings()
		local gameSettings = instance.GameSettings

		assert.not_nil(gameSettings)
		assert.equals(typeof(gameSettings), "UserGameSettings")
	end)

	it("should not allow me to set the GameSettings property", function()
		local instance = UserSettings()
		assert.has.errors(function()
			instance.GameSettings = true
		end)
	end)

	it("should not allow me to access undefined properties", function()
		local instance = UserSettings()
		assert.has.errors(function()
			tostring(instance.thisDoesNotExist)
		end)
	end)

	it("should not allow me to set undefined properties", function()
		local instance = UserSettings()
		assert.has.errors(function()
			instance.thisDoesNotExist = "this should throw"
		end)
	end)
end)