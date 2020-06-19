local createEnum = import("../createEnum")

return createEnum("TouchCameraMovementMode", {
	Default = 0,
	Follow = 2,
	Classic = 1,
	Orbital = 3,
})
