local createEnum = import("../createEnum")

return createEnum("CameraType", {
	Fixed = 0,
	Watch = 2,
	Attach = 1,
	Track = 3,
	Follow = 4,
	Custom = 5,
	Scriptable = 6,
	Orbital = 7,
})
