local InstanceProperty = {}

local function merge(...)
	local target = {}

	for i = 1, select("#", ...) do
		for key, value in pairs((select(i, ...))) do
			target[key] = value
		end
	end

	return target
end

function InstanceProperty.normal(config)
	return merge({
		get = function(self, key)
			return getmetatable(self).instance.properties[key]
		end,
		set = function(self, key, value)
			getmetatable(self).instance.properties[key] = value
		end,
		getDefault = function()
			return nil
		end,
	}, config)
end

function InstanceProperty.readOnly(config)
	return merge(InstanceProperty.normal(config), {
		set = function(self, key, value)
			error(string.format("Unable to assign property %s. Script write access is restricted.", key))
		end,
	}, config)
end

return InstanceProperty