local BaseInstance = import("./BaseInstance")
local InstanceProperty = import("../InstanceProperty")

local ModuleScript = BaseInstance:extend("ModuleScript")

ModuleScript.properties.Source = InstanceProperty.normal({
	getDefault = function()
		return ""
	end,
})

return ModuleScript