local BaseInstance = import("./BaseInstance")
local InstanceProperty = import("../InstanceProperty")
local Vector2 = import("../types/Vector2")

local ScreenGui = BaseInstance:extend("ScreenGui")

ScreenGui.properties.AbsoluteSize = InstanceProperty.readOnly({
	get = function(self)
		return Vector2.new(800, 600)
	end,
})

ScreenGui.properties.DisplayOrder = InstanceProperty.normal({
	set = function(self, key, value)
		if type(value) ~= "number" then
			error(string.format("%s must be a number", key), 2)
		end

		getmetatable(self).instance.properties[key] = value
	end,

	getDefault = function()
		return 0
	end,
})

return ScreenGui