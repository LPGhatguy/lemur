local BaseInstance = import("./BaseInstance")
local CoreGui = BaseInstance:extend("CoreGui")
local InstanceProperty = import("../InstanceProperty")

CoreGui.properties.RobloxGui = InstanceProperty.normal({})

return CoreGui