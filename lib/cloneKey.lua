--[[
	This key is used to mark Roblox objects and implement Clone implementations

	Use it as a key into a userdata object's metatable.
]]

local cloneKey = newproxy(true)

getmetatable(cloneKey).__tostring = function()
	return "<Lemur Clone Identifier>"
end

return cloneKey