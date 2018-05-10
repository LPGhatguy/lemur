local names = {
	"ConnectionState",
	"EasingDirection",
	"EasingStyle",
	"Font",
	"HorizontalAlignment",
	"Platform",
	"PlaybackState",
	"ScaleType",
	"SizeConstraint",
	"SortOrder",
	"TextXAlignment",
	"TextYAlignment",
	"ThumbnailSize",
	"ThumbnailType",
	"VerticalAlignment",
	"VirtualInputMode",
}

local enums = {}

for _, name in ipairs(names) do
	enums[name] = import("./" .. name)
end

return enums