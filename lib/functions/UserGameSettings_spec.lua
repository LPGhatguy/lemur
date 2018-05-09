local UserGameSettings = import("./UserGameSettings")
local typeof = import("./typeof")

describe("functions.settings.UserGameSettings", function()
	it("should be an object", function()
		local instance = UserGameSettings.new()
		assert.not_nil(instance)
		assert.equals(type(instance), "userdata")
	end)

	it("should be of type UserGameSettings", function()
		local instance = UserGameSettings.new()
		assert.equals(typeof(instance), "UserGameSettings")
	end)

	it("should not allow me to access undefined properties", function()
		local instance = UserGameSettings.new()
		assert.has.errors(function()
			tostring(instance.thisDoesNotExist)
		end)
	end)

	it("should not allow me to set undefined properties", function()
		local instance = UserGameSettings.new()
		assert.has.errors(function()
			instance.thisDoesNotExist = "this should throw"
		end)
	end)

	it("should have a method InStudioMode", function()
		local instance = UserGameSettings.new()
		instance:InStudioMode()
	end)
end)