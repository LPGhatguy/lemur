local createEnum = import("../createEnum")

return createEnum("PlayerChatType", {
	All = 0,
	Team = 1,
	Whisper = 2,
})
