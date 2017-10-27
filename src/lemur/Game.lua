local Instance = import("./Instance")

local Game = {}
Game.__index = Game

function Game.new(habitat)
	local game = {}

	game.ClassName = "DataModel"

	game._habitat = habitat
	game._services = {}

	setmetatable(game, Game)

	game._services.RunService = Instance.new("RunService", game)
	game._services.Lemur = Instance.new("Lemur", game)

	return game
end

function Game:GetService(serviceName)
	if self._services[serviceName] then
		return self._services[serviceName]
	end

	error(string.format("Cannot get service %q", tostring(serviceName)), 2)
end

return Game