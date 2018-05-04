local assign = import("../assign")
local RenderSettings = import("./settings/RenderSettings")

local Settings = {}

setmetatable(Settings, {
	__tostring = function()
		return "Settings"
	end,
})

local prototype = {}

function prototype:GetFFlag(name)
	return self.settings[name] or false
end

local metatable = {}
metatable.type = Settings

function metatable:__index(key)
	local internal = getmetatable(self).internal

	if internal[key] ~= nil then
		return internal[key]
	end

	if prototype[key] ~= nil then
		return prototype[key]
	end

	error(string.format("%s is not a valid member of Settings", tostring(key)), 2)
end

function Settings.new(settings)
	local internalInstance = {
		settings = settings or {},
		Rendering = RenderSettings.new()
	}

	local instance = newproxy(true)

	assign(getmetatable(instance), metatable)
	getmetatable(instance).internal = internalInstance

	return instance
end

local instance = Settings.new({})
return function()
	return instance
end