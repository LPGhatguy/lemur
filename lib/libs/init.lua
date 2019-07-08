local names = {
	"math",
	"string",
}

local libs = {}

for _, name in ipairs(names) do
	libs[name] = import("./" .. name)
end

return libs
