local createEnumGroup = import("../createEnumGroup")

local names = {
	"ConnectionState",
	"CreatorType",
	"DataStoreRequestType",
	"EasingDirection",
	"EasingStyle",
	"FillDirection",
	"Font",
	"HorizontalAlignment",
	"HttpContentType",
	"Platform",
	"InfoType",
	"KeyCode",
	"MouseBehavior",
	"PlaybackState",
	"ScaleType",
	"ScrollingDirection",
	"SizeConstraint",
	"SortOrder",
	"TextXAlignment",
	"TextYAlignment",
	"ThumbnailSize",
	"ThumbnailType",
	"UserInputType",
	"VerticalAlignment",
	"VirtualInputMode",
	"ZIndexBehavior",
}

local enums = {}

for _, name in ipairs(names) do
	enums[name] = import("./" .. name)
end

return createEnumGroup(enums)
