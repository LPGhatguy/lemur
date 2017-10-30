return function(object)
	local realType = type(object)

	if realType == "table" then
		if object._isInstance then
			return "Instance"
		end
	end

	return realType
end