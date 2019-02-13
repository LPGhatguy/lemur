local BaseInstance = import("./BaseInstance")
local InstanceProperty = import("../InstanceProperty")

local ModuleScript = BaseInstance:extend("ModuleScript", {
	creatable = true,
})

function ModuleScript:postClone(old)
	getmetatable(self).instance.modulePath = getmetatable(old).instance.modulePath
end

ModuleScript.properties.Source = InstanceProperty.normal({
	getDefault = function()
		return ""
	end,
})

return ModuleScript