local createEnum = import("../createEnum")

return createEnum("ThrottlingPriority", {
	Extreme = 2,
	ElevatedOnServer = 1,
	Default = 0,
})
