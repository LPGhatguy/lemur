local typeKey = import("./typeKey")

local function createEnumGroup(enums)
	local enumGroup = newproxy(true)

	getmetatable(enumGroup)[typeKey] = "Enums"

	getmetatable(enumGroup).__tostring = function()
		return "Enums"
	end

	return enumGroup
end

return createEnumGroup