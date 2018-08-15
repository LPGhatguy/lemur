local BaseInstance = import("./BaseInstance")
local InstanceProperty = import("../InstanceProperty")
local Vector2 = import("../types/Vector2")
local ZIndexBehavior = import("../Enum/ZIndexBehavior")

local ScreenGui = BaseInstance:extend("ScreenGui", {
	creatable = true,
})

ScreenGui.properties.AbsolutePosition = InstanceProperty.readOnly({
	get = function(self)
		return Vector2.new(0, 0)
	end,
})

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

ScreenGui.properties.ZIndexBehavior = InstanceProperty.enum(ZIndexBehavior, {
	getDefault = function()
		return ZIndexBehavior.Global
	end,
})

return ScreenGui