local BaseInstance = import("./BaseInstance")
local Players = BaseInstance:extend("Players")
local InstanceProperty = import("../InstanceProperty")

Players.properties.NumPlayers = InstanceProperty.readOnly({
    getDefault = function()
        return 1
    end,
})

return Players
