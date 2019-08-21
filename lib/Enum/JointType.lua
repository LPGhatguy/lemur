local createEnum = import("../createEnum")

return createEnum("JointType", {
	None = 28,
	Rotate = 7,
	RotateP = 8,
	RotateV = 9,
	Glue = 10,
	Weld = 1,
	Snap = 3,
})
