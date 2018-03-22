return function(object)
	local realType = type(object)

	if realType == "userdata" then
		if getmetatable(object).instance then
			return "Instance"
		end
	end

	return realType
end