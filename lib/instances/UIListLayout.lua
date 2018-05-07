local BaseInstance = import("./BaseInstance")
local InstanceProperty = import("../InstanceProperty")
local UDim = import("../types/UDim")
local UIListLayout = BaseInstance:extend("UIListLayout")

UIListLayout.properties.Padding = InstanceProperty.normal({
	getDefault = function()
		return UDim.new()
	end,
})

UIListLayout.properties.SortOrder = InstanceProperty.normal({
	getDefault = function()
		return 0
	end,
})

return UIListLayout