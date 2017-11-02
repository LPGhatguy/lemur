local names = {
	"typeof",
	"warn",
	"tick",
	"wait",
}

local functions = {}

for _, name in ipairs(names) do
	functions[name] = import("./" .. name)
end

return functions