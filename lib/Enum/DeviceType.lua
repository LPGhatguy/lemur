local createEnum = import("../createEnum")

return createEnum("DeviceType", {
	Unknown = 0,
	Desktop = 1,
	Tablet = 2,
	Phone = 3,
})
