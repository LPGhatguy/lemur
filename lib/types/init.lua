local names = {
	"Color3",
}

local types = {}

for _, name in ipairs(names) do
	types[name] = import("./" .. name)
end

return types