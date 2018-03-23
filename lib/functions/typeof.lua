return function(object)
	local realType = type(object)

	if realType == "userdata" then
		local metatable = getmetatable(object)

		if not metatable then
			return "userdata"
		end

		if metatable.type then
			return tostring(metatable.type)
		end

		-- TODO: Change the way that instances signal their type
		if getmetatable(object).instance then
			return "Instance"
		end
	end

	return realType
end