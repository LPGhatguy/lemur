local createEnum = import("../createEnum")

return createEnum("MoveState", {
	Stopped = 0,
	Coasting = 1,
	Pushing = 2,
	Stopping = 3,
	AirFree = 4,
})
