local instances = require("instances")

local Instance = {}
Instance.__index = Instance

function Instance.new(name)
	if not instances[name] then
		error(string.format("Can't make an instance of type %q", tostring(name)), 2)
	end

	local new = {
		ClassName = name,
		Name = name,
	}

	return new
end

return Instance