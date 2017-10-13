local root = (...):match("^(.-%.)[^.]+$")

return {
	Folder = require(root .. "instances.Folder"),
}