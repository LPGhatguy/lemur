local names = {
	"Color3",
	"UDim",
	"UDim2",
	"Vector2",
}

local types = {}

for _, name in ipairs(names) do
	types[name] = import("./" .. name)
end

return types