local names = {
	"ConnectionState",
	"EasingDirection",
	"EasingStyle",
	"Font",
	"Platform",
	"VirtualInputMode",
}

local enums = {}

for _, name in ipairs(names) do
	enums[name] = import("./" .. name)
end

return enums