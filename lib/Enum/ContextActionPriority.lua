local createEnum = import("../createEnum")

return createEnum("ContextActionPriority", {
	Low = 1000,
	Medium = 2000,
	Default = 2000,
	High = 3000,
})
