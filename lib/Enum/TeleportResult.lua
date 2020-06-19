local createEnum = import("../createEnum")

return createEnum("TeleportResult", {
	Success = 0,
	Failure = 1,
	GameNotFound = 2,
	GameEnded = 3,
	GameFull = 4,
	Unauthorized = 5,
	Flooded = 6,
	IsTeleporting = 7,
})
