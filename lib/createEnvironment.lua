local createSettings = import("./createSettings")
local functions = import("./functions")
local types = import("./types")
local Enum = import("./Enum")
local Instance = import("./Instance")

local baseEnvironment = {}

for key, value in pairs(_G) do
	baseEnvironment[key] = value
end

for key, value in pairs(functions) do
	baseEnvironment[key] = value
end

for key, value in pairs(types) do
	baseEnvironment[key] = value
end

baseEnvironment.Instance = Instance
baseEnvironment.Enum = Enum

--[[
	Create a new script environment, suitable for use with the given habitat.
]]
local function createEnvironment(habitat)
	local new = {}

	for key, value in pairs(baseEnvironment) do
		new[key] = value
	end

	new.settings = createSettings(habitat.settings)

	new.require = function(path)
		return habitat:require(path)
	end

	new.game = habitat.game

	return new
end

return createEnvironment