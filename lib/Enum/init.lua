local names = {
	"ConnectionState",
	"EasingDirection",
	"EasingStyle",
	"Font",
	"Platform",
	"PlaybackState",
	"ScaleType",
	"SortOrder",
	"TextXAlignment",
	"TextYAlignment",
	"VirtualInputMode",
}

local enums = {}

for _, name in ipairs(names) do
	enums[name] = import("./" .. name)
end

return enums