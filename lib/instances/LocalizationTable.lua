local BaseInstance = import("./BaseInstance")
local InstanceProperty = import("../InstanceProperty")
local json = import("../json")

local CONTENTS = "contents"

local LocalizationTable = BaseInstance:extend("LocalizationTable")

LocalizationTable.properties.SourceLocaleId = InstanceProperty.normal({
	getDefault = function()
		return "en-us"
	end,
})

function LocalizationTable.prototype:SetContents(contents)
	getmetatable(self).instance.properties[CONTENTS] = json.decode(contents)
end

function LocalizationTable.prototype:GetString(targetLocaleId, key)
	local contents = getmetatable(self).instance.properties[CONTENTS]

	if contents == nil then
		return nil
	end

	for _, entry in ipairs(contents) do
		if entry.key == key then
			return entry.values[targetLocaleId]
		end
	end

	return nil
end

return LocalizationTable