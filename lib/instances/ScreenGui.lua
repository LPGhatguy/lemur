local BaseInstance = import("./BaseInstance")
local InstanceProperty = import("../InstanceProperty")
local ScreenGui = BaseInstance:extend("ScreenGui")

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