local RenderSettings = import("./settings/RenderSettings")

local Settings = {}
Settings.__index = Settings
Settings.type = "Settings"

function Settings.new(settings)
	local instance = {
		settings = settings or {},
		Rendering = RenderSettings.new(),
	}

	setmetatable(instance, Settings)
	return instance
end

function Settings:GetFFlag(name)
	return self.settings[name] or false
end

local instance = Settings.new({})
return function()
	return instance
end