local typeof = import("./functions/typeof")
local assign = import("./assign")

local InstanceProperty = {}

function InstanceProperty.normal(config)
	return assign({}, {
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
	return assign(InstanceProperty.normal(config), {
		set = function(self, key, value)
			error(string.format("Unable to assign property %s. Script write access is restricted.", key))
		end,
	}, config)
end

--[[
	This method forces the value of a setter to be typed.

	`type` is a string paramater that is compared to typeof(value)
]]
function InstanceProperty.typed(type, config)
	return assign(InstanceProperty.normal(config), {
		set = function(self, key, value)
			local passedType = typeof(value)
			if passedType ~= type then
				error(string.format("%s must be of type %s, received type %s", key, type, passedType), 2)
			end

			getmetatable(self).instance.properties[key] = value
		end,
	}, config)
end

return InstanceProperty