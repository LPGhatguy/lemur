local Enum = import("../Enum")
local BaseInstance = import("./BaseInstance")
local InstanceProperty = import("../InstanceProperty")
local UDim = import("../types/UDim")
local UIListLayout = BaseInstance:extend("UIListLayout")

UIListLayout.properties.Padding = InstanceProperty.typed("UDim", {
	getDefault = function()
		return UDim.new()
	end,
})

UIListLayout.properties.SortOrder = InstanceProperty.typed("number", {
	getDefault = function()
		return Enum.SortOrder.Name
	end,
})

return UIListLayout