local names = {
	"require",
	"typeof",
}

local functions = {}

for _, name in ipairs(names) do
	functions[name] = require("lemur.functions." .. name)
end

return functions