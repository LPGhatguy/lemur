local createEnum = import("../createEnum")

return createEnum("HttpCachePolicy", {
	None = 0,
	Full = 1,
	DataOnly = 2,
	Default = 3,
	InternalRedirectRefresh = 4,
})
