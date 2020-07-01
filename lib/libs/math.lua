local rbxMath = {}

for key, value in pairs(math) do
	rbxMath[key] = value
end

rbxMath.clamp = function(n, min, max)
	return math.min(max, math.max(min, n))
end

rbxMath.sign = function(n)
	return n > 0 and 1 or n < 0 and -1 or 0
end

return rbxMath
