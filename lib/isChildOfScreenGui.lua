return function(instance)
	while instance ~= nil do
		if instance.ClassName == "ScreenGui" then
			return true
		end

		instance = instance.Parent
	end

	return false
end
