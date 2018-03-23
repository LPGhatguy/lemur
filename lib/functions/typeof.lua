return function(object)
	local realType = type(object)

	if realType == "userdata" then
		if getmetatable(object).instance then
			return "Instance"
		end
	elseif realType == "table" then
		local metatable = getmetatable(object)

		if metatable == nil then
			return realType
		end

		if metatable.__type == "Color3" then
			return "Color3"
		end
	end

	return realType
end