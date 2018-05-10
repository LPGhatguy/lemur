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
	"ThumbnailSize",
	"ThumbnailType",
	"VirtualInputMode",
}

local enums = {}

for _, name in ipairs(names) do
	enums[name] = import("./" .. name)
end

return enums