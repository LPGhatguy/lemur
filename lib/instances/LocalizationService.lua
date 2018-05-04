local BaseInstance = import("./BaseInstance")
local InstanceProperty = import("../InstanceProperty")
local LocalizationService = BaseInstance:extend("LocalizationService")

LocalizationService.properties.SystemLocaleId = InstanceProperty.readOnly({
	getDefault = function()
		return "en-us"
	end,
})

return LocalizationService