local BaseInstance = import("./BaseInstance")
local InstanceProperty = import("../InstanceProperty")
local UITextSizeConstraint = BaseInstance:extend("UITextSizeConstraint")

UITextSizeConstraint.properties.MinTextSize = InstanceProperty.typed("number", {
	getDefault = function()
		return 1
	end,
})

UITextSizeConstraint.properties.MaxTextSize = InstanceProperty.typed("number", {
	getDefault = function()
		return 1000
	end,
})

return UITextSizeConstraint