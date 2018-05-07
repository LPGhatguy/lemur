local BaseInstance = import("./BaseInstance")
local HttpService = import("./HttpService")
local InstanceProperty = import("../InstanceProperty")
local LocalizationTable = BaseInstance:extend("LocalizationTable")

local httpService = HttpService:new()

LocalizationTable.properties.SourceLocaleId = InstanceProperty.normal({
	getDefault = function()
		return "en-us"
	end,
})

LocalizationTable.properties.Contents = InstanceProperty.normal({
	getDefault = function()
		return {}
	end,
})

function LocalizationTable.prototype:SetContents(contents)
	self.Contents = httpService:JSONDecode(contents)
end

function LocalizationTable.prototype:GetString(targetLocaleId, key)
	for _, entry in ipairs(self.Contents) do
		if entry.key == key then
			return entry.values[targetLocaleId]
		end
	end

	return nil
end

return LocalizationTable