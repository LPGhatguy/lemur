local functions = import("./functions")
local types = import("./types")
local Enum = import("./Enum")
local Instance = import("./Instance")

local environment = {}

do
	environment.base = {}

	for key, value in pairs(_G) do
		environment.base[key] = value
	end

	for key, value in pairs(functions) do
		environment.base[key] = value
	end

	for key, value in pairs(types) do
		environment.base[key] = value
	end

	environment.base.Instance = Instance
	environment.base.Enum = Enum
end

--[[
	Create a new function environment, suitable for use with the given script
	instance.
]]
function environment.create(habitat, scriptInstance)
	local new = {}

	for key, value in pairs(environment.base) do
		new[key] = value
	end

	new.require = function(path)
		return habitat:require(path)
	end

	new.script = scriptInstance
	new.game = habitat.game

	return new
end

return environment