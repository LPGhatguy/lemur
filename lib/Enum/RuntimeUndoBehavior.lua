local createEnum = import("../createEnum")

return createEnum("RuntimeUndoBehavior", {
	Aggregate = 0,
	Snapshot = 1,
	Hybrid = 2,
})
