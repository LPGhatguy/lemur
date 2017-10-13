local Instance = require("Instance")
local Game = require("Game")

local patchValues = {}
local capturedValues = {}

do
	local oldRequire = require
	patchValues.require = function(target)
		if type(target) == "string" then
			return oldRequire(target)
		end

		error("NYI")
	end
end

do
	patchValues.game = Game.new()
	patchValues.Instance = Instance
end

local function capture()
	for key in pairs(patchValues) do
		capturedValues[key] = _G[key]
	end
end

local function patch()
	capture()

	for key, value in pairs(patchValues) do
		_G[key] = value
	end
end

local function revert()
	for key in pairs(patchValues) do
		_G[key] = capturedValues[key]
	end
end

return {
	patch = patch,
	revert = revert,
}