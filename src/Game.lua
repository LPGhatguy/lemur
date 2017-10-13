local services = require("services")

local Game = {}
Game.__index = Game

function Game.new()
	local new = {}

	setmetatable(new, Game)

	return new
end

function Game:GetService(serviceName)
	if services[serviceName] then
		return services[serviceName]
	end

	error(string.format("Cannot get service %q", tostring(serviceName)), 2)
end

return Game