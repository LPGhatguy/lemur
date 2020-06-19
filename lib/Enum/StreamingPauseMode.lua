local createEnum = import("../createEnum")

return createEnum("StreamingPauseMode", {
	Default = 0,
	Disabled = 1,
	ClientPhysicsPause = 2,
})
