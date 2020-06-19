local createEnum = import("../createEnum")

return createEnum("ComputerCameraMovementMode", {
	Default = 0,
	Follow = 2,
	Classic = 1,
	Orbital = 3,
})
