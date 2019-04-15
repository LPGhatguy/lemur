local names = {
	"math",
}

local libs = {}

for _, name in ipairs(names) do
	libs[name] = import("./" .. name)
end

return libs