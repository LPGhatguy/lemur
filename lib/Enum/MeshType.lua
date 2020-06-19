local createEnum = import("../createEnum")

return createEnum("MeshType", {
	Head = 0,
	Torso = 1,
	Wedge = 2,
	Prism = 7,
	Pyramid = 8,
	ParallelRamp = 9,
	RightAngleRamp = 10,
	CornerWedge = 11,
	Brick = 6,
	Sphere = 3,
	Cylinder = 4,
	FileMesh = 5,
})
