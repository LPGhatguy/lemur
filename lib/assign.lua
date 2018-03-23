--[[
	An implementation of JavaScript's Object.assign
]]

return function(target, ...)
	for i = 1, select("#", ...) do
		for key, value in pairs((select(i, ...))) do
			target[key] = value
		end
	end

	return target
end