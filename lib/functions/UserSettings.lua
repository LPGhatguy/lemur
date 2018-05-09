local assign = import("../assign")
local UserGameSettings = import("./UserGameSettings")

local UserSettings = {}

setmetatable(UserSettings, {
	__tostring = function()
		return "UserSettings"
	end,
})

local prototype = {}

local metatable = {}
metatable.type = UserSettings

function metatable:__index(key)
	local internal = getmetatable(self).internal

	if internal[key] ~= nil then
		return internal[key]
	end

	if prototype[key] ~= nil then
		return prototype[key]
	end

	error(string.format("%s is not a valid member of UserSettings", tostring(key)), 2)
end

function UserSettings.new()
	local internalInstance = {
		GameSettings = UserGameSettings.new()
	}

	local instance = newproxy(true)

	assign(getmetatable(instance), metatable)
	getmetatable(instance).internal = internalInstance

	return instance
end

local instance = UserSettings.new({})
return function()
	return instance
end