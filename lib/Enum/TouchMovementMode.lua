local createEnum = import("../createEnum")

return createEnum("TouchMovementMode", {
	Default = 0,
	Thumbstick = 1,
	DPad = 2,
	Thumbpad = 3,
	ClickToMove = 4,
	DynamicThumbstick = 5,
})
