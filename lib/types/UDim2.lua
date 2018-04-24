local assign = import("../assign")
local typeof = import("../functions/typeof")
local UDim = import("./UDim")

local function lerpNumber(a, b, alpha)
	return (1 - alpha) * a + b * alpha
end

local UDim2 = {}

setmetatable(UDim2, {
	__tostring = function()
		return "UDim2"
	end,
})

local prototype = {}

function prototype:Lerp(goal, alpha)
	return UDim2.new(
		lerpNumber(self.X.Scale, goal.X.Scale, alpha),
		lerpNumber(self.X.Offset, goal.X.Offset, alpha),
		lerpNumber(self.Y.Scale, goal.Y.Scale, alpha),
		lerpNumber(self.Y.Offset, goal.Y.Offset, alpha)
	)
end

local metatable = {}
metatable.type = UDim2

function metatable:__index(key)
	local internal = getmetatable(self).internal

	if internal[key] ~= nil then
		return internal[key]
	end

	if prototype[key] ~= nil then
		return prototype[key]
	end

	error(string.format("%s is not a valid member of UDim2", tostring(key)), 2)
end

function metatable:__eq(other)
	return self.X == other.X and self.Y == other.Y
end

function metatable:__add(other)
	return UDim2.new(self.X + other.X, self.Y + other.Y)
end

function UDim2.new(...)
	local param1, param2, param3, param4 = ...

	if typeof(param1) ~= "UDim" then
		return UDim2.new(
			UDim.new(param1, param2), -- UDim converts params to numbers by default
			UDim.new(param3, param4)
		)
	end

	if typeof(param2) ~= "UDim" then
		param2 = UDim.new()
	end

	local internalInstance = {
		X = param1,
		Y = param2,
		Width = param1,
		Height = param2,
	}
	local instance = newproxy(true)

	assign(getmetatable(instance), metatable)
	getmetatable(instance).internal = internalInstance

	return instance
end

return UDim2
