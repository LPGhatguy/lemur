local BaseInstance = import("./BaseInstance")
local CoreGui = BaseInstance:extend("CoreGui")
local InstanceProperty = import("../InstanceProperty")

CoreGui.properties.RobloxGui = InstanceProperty.normal({
	getDefault = function()
		local Instance = import("../Instance")
		return Instance.new("ScreenGui")
	end,
})

return CoreGui