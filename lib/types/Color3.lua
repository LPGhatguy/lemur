local Color3 = {}
Color3.__index = Color3

function Color3.new(...)
	if select("#", ...) == 0 then
		return Color3.new(0, 0, 0)
	else
		local r, g, b = ...

		return setmetatable({
			r = r,
			g = g,
			b = b,
		}, Color3)
	end
end

function Color3.fromRGB(r, g, b)
	return Color3.new(r / 255, g / 255, b / 255)
end

function Color3.fromHSV(h, s, v)
	-- Convert h to a 360-degree value (inputs as between 0 and 1)
	h = h * 360

	-- Sector of the HSV color space (there are 6) that the hue falls in
	local sector = h / 60
	local chroma = s * v
	local x = chroma * (1 - math.abs(sector % 2 - 1))
	local m = v - chroma

	local r, g, b

	if sector >= 0 and sector <= 1 then
		r, g, b = chroma, x, 0
	elseif sector >= 1 and sector <= 2 then
		r, g, b = x, chroma, 0
	elseif sector >= 2 and sector <= 3 then
		r, g, b = 0, chroma, x
	elseif sector >= 3 and sector <= 4 then
		r, g, b = 0, x, chroma
	elseif sector >= 4 and sector <= 5 then
		r, g, b = x, 0, chroma
	elseif sector >= 5 and sector < 6 then
		r, g, b = chroma, 0, x
	else
		-- Return a default value of 0, 0, 0. This will happen if h is not between 0 and 1.
		return Color3.new(0, 0, 0)
	end

	return Color3.new(r + m, g + m, b + m)
end

return Color3
