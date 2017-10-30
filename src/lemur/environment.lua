local functions = import("./functions")
local Instance = import("./Instance")
local Game = import("./Game")

local environment = {}

do
	environment.base = {}

	for key, value in pairs(_G) do
		environment.base[key] = value
	end

	for key, value in pairs(functions) do
		environment[key] = value
	end

	environment.Instance = Instance
	environment.game = Game.new()
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
		if type(path) == "table" then
			return habitat:require(path)
		else
			return require(path)
		end
	end

	new.script = scriptInstance

	return new
end

return environment