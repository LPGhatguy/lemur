local names = {
	"UserSettings",
	"settings",
	"spawn",
	"tick",
	"typeof",
	"wait",
	"warn",
}

local functions = {}

for _, name in ipairs(names) do
	functions[name] = import("./" .. name)
end

return functions