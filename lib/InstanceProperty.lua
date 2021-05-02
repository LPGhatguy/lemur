local assign = import("./assign")
local cloneKey = import("./cloneKey")
local typeof = import("./functions/typeof")

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
		clone = function(self, key)
			local value = getmetatable(self).instance.properties[key]

			if typeof(value) == "Instance" then
				return value
			elseif type(value) == "userdata" and typeof(value) ~= "userdata" then
				-- Lemur implemented userdata, should have its own Clone function
				local metatable = assert(getmetatable(value), "no metatable on cloning userdata")
				local cloneImpl = assert(metatable[cloneKey], "no clone implementation for " .. typeof(value))
				return cloneImpl(value)
			end

			return value
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

function InstanceProperty.enum(enum, config)
	return assign(InstanceProperty.normal(config), {
		set = function(self, key, value)
			local passedType = typeof(value)

			if passedType ~= "EnumItem" then
				error(string.format("Expected enum from %s, received type %s", tostring(enum), passedType), 2)
			end

			if value.EnumType ~= enum then
				error(string.format("Expected enum from %s, got enum from %s", tostring(enum), tostring(value.EnumType)), 2)
			end

			getmetatable(self).instance.properties[key] = value
		end,
	}, config)
end

return InstanceProperty