local createEnum = import("../createEnum")

return createEnum("SurfaceConstraint", {
	None = 0,
	Hinge = 1,
	SteppingMotor = 2,
	Motor = 3,
})
