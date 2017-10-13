local root = (...):match("^(.-%.)[^.]+$")

return {
	RunService = require(root .. "services.RunService"),
}