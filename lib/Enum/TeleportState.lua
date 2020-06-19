local createEnum = import("../createEnum")

return createEnum("TeleportState", {
	RequestedFromServer = 0,
	Started = 1,
	WaitingForServer = 2,
	Failed = 3,
	InProgress = 4,
})
