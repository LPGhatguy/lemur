local createEnum = import("../createEnum")

return createEnum("PathStatus", {
	Success = 0,
	ClosestNoPath = 1,
	ClosestOutOfRange = 2,
	FailStartNotEmpty = 3,
	FailFinishNotEmpty = 4,
	NoPath = 5,
})
