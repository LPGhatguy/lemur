local RenderSettings = {}
RenderSettings.__index = RenderSettings
RenderSettings.type = "RenderSettings"

function RenderSettings.new()
	local instance = {
		QualityLevel = 0,
	}

	setmetatable(instance, RenderSettings)
	return instance
end

return RenderSettings