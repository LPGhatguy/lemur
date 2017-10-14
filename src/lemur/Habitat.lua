--[[
	A Lemur Habitat is an instance of an emulated Roblox environment.

	It is the root instance of the emulated hierarchy.
]]

local Game = require("lemur.Game")
local environment = require("lemur.environment")

local Habitat = {}
Habitat.__index = Habitat

function Habitat.new(path)
	local habitat = {}

	habitat._path = path

	habitat.game = Game.new(habitat)

	setmetatable(habitat, Habitat)

	return habitat
end

function Habitat:fileExists(path)
	local fullPath = self._path .. "/" .. path

	local handle = io.open(fullPath, "r")

	if not handle then
		return false
	end

	handle:close()

	return true
end

function Habitat:_load(path)
	local fullPath = self._path .. "/" .. path

	return loadfile(fullPath)
end

function Habitat:require(instance)
	if instance._loaded then
		return instance._result
	end

	local chunk, err = self:_load(instance._path)

	if not chunk then
		error(err)
	end

	local env = environment.create(self, instance)
	setfenv(chunk, env)

	local result = chunk()

	instance._loaded = true
	instance._result = result

	return result
end

return Habitat