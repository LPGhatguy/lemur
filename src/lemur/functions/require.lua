local oldRequire = require
local function require(path)
	return oldRequire(path)
end

return require