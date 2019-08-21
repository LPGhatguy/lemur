local createEnum = import("../createEnum")

return createEnum("BreakReason", {
	Other = 0,
	Error = 1,
	UserBreakpoint = 3,
	SpecialBreakpoint = 2,
})
