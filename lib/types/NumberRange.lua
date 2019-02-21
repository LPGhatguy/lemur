local assign = import("../assign")
local typeKey = import("../typeKey")

local NumberRange = {}

setmetatable(NumberRange, {
	__tostring = function()
		return "NumberRange"
	end,
})

local prototype = {}

local metatable = {}
metatable[typeKey] = "NumberRange"

function metatable:__index(key)
	local internal = getmetatable(self).internal

	if internal[key] ~= nil then
		return internal[key]
	end

	if prototype[key] ~= nil then
		return prototype[key]
	end

	error(string.format("%s is not a valid member of NumberRange", tostring(key)), 2)
end

function metatable:__eq(other)
	return self.Min == other.Min and self.Max == other.Max
end

function NumberRange.new(...)
	if select("#", ...) == 1 then
		local n = ({...})[1]

		return NumberRange.new(n, n)
	end

	local Min, Max = ...
	if type(Min) ~= "number" or type(Max) ~= "number" then
		error("NumberRange.new must take in 2 numbers", 2)
	end

	local internalInstance = {
		Min = Min,
		Max = Max,
	}

	local instance = newproxy(true)

	assign(getmetatable(instance), metatable)
	getmetatable(instance).internal = internalInstance

	return instance
end

return NumberRange
