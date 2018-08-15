local typeKey = import("./typeKey")

local function createEnumGroup(enums)
	local enumGroup = newproxy(true)

	getmetatable(enumGroup)[typeKey] = "Enums"

	getmetatable(enumGroup).__tostring = function()
		return "Enums"
	end

	getmetatable(enumGroup).__index = function(self, key)
		local enum = enums[key]

		if enum == nil then
			-- Roblox mistakenly says that we tried to access an EnumItem; this
			-- message is corrected.
			error(("%s is not a valid Enum"):format(tostring(key)), 2)
		end

		return enum
	end

	return enumGroup
end

return createEnumGroup