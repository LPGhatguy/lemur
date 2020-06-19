local createEnum = import("../createEnum")

return createEnum("TeleportType", {
	ToPlace = 0,
	ToInstance = 1,
	ToReservedServer = 2,
})
