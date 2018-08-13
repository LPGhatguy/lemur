local BaseInstance = import("./BaseInstance")
local InstanceProperty = import("../InstanceProperty")
local ServerScriptService = BaseInstance:extend("ServerScriptService")

ServerScriptService.properties.LoadStringEnabled = InstanceProperty.typed("boolean", {
	getDefault = function()
		return false
	end,
})

return ServerScriptService