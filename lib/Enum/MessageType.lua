local createEnum = import("../createEnum")

return createEnum("MessageType", {
	MessageOutput = 0,
	MessageInfo = 1,
	MessageWarning = 2,
	MessageError = 3,
})
