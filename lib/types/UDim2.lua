local assign = import("../assign")

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

function prototype:lerp(goal, alpha)
	return UDim2.new(
		lerpNumber(self.X, goal.X, alpha),
		lerpNumber(self.Y, goal.Y, alpha),
		lerpNumber(self.Width, goal.Width, alpha),
		lerpNumber(self.Height, goal.Height, alpha)
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
	return self.X == other.X and self.Y == other.Y and self.Width == other.Width and self.Height == other.Height
end

function metatable:__add(other)
    return UDim2.new(self.X + other.X, self.Width + other.Width, self.Y + other.Y, self.Height + other.Height)
end

function UDim2.new(...)
	if select("#", ...) == 0 then
		return UDim2.new(0, 0, 0, 0)
    end

    if select("#", ...) == 2 then
       local xDim, yDim = ...
       return UDim2.new(xDim.Scale, xDim.Offset, yDim.Scale, yDim.Offset)
    end

	local X, Width, Y, Height = ...

	local internalInstance = {
        X = X,
        Width = Width,
        Y = Y,
        Height = Height,
	}

	local instance = newproxy(true)

	assign(getmetatable(instance), metatable)
	getmetatable(instance).internal = internalInstance

	return instance
end

return UDim2
