local names = {
	"ConnectionState",
	"EasingDirection",
	"EasingStyle",
	"FillDirection",
	"Font",
	"HorizontalAlignment",
	"Platform",
	"PlaybackState",
	"ScaleType",
	"ScrollingDirection",
	"SizeConstraint",
	"SortOrder",
	"TextXAlignment",
	"TextYAlignment",
	"ThumbnailSize",
	"ThumbnailType",
	"VerticalAlignment",
	"VirtualInputMode",
	"ZIndexBehavior",
}

local enums = {}

for _, name in ipairs(names) do
	enums[name] = import("./" .. name)
end

return enums