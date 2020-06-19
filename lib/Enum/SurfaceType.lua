local createEnum = import("../createEnum")

return createEnum("SurfaceType", {
	Smooth = 0,
	Glue = 1,
	Weld = 2,
	Studs = 3,
	Inlet = 4,
	Universal = 5,
	Hinge = 6,
	Motor = 7,
	SteppingMotor = 8,
	SmoothNoOutlines = 10,
})
