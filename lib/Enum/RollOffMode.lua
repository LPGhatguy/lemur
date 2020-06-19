local createEnum = import("../createEnum")

return createEnum("RollOffMode", {
	Inverse = 0,
	Linear = 1,
	InverseTapered = 3,
	LinearSquare = 2,
})
