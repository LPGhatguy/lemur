local Color3 = {}

function Color3.new(...)
	if select("#", ...) == 0 then
		return Color3.new(0, 0, 0)
	else
		local r, g, b = ...

		return {
			r = r,
			g = g,
			b = b,
		}
	end
end

function Color3.fromRGB(r, g, b)
	return Color3.new(r / 255, g / 255, b / 255)
end

return Color3
