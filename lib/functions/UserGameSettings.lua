local assign = import("../assign")

local UserGameSettings = {}

setmetatable(UserGameSettings, {
	__tostring = function()
		return "UserGameSettings"
	end,
})

local prototype = {}

function prototype:InStudioMode()
	return false
end

local metatable = {}
metatable.type = UserGameSettings

function metatable:__index(key)
	local internal = getmetatable(self).internal

	if internal[key] ~= nil then
		return internal[key]
	end

	if prototype[key] ~= nil then
		return prototype[key]
	end

	error(string.format("%s is not a valid member of UserGameSettings", tostring(key)), 2)
end

function metatable:__newindex(key, value)
	local internal = getmetatable(self).internal

	if internal[key] ~= nil then
		internal[key] = value
		return
	end

	error(string.format("%q is not a valid member of UserGameSettings", tostring(key)), 2)
end


function UserGameSettings.new()
	local internalInstance = {}

	local instance = newproxy(true)

	assign(getmetatable(instance), metatable)
	getmetatable(instance).internal = internalInstance

	return instance
end

return UserGameSettings