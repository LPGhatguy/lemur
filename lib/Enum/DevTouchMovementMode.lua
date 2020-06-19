local createEnum = import("../createEnum")

return createEnum("DevTouchMovementMode", {
	UserChoice = 0,
	Thumbstick = 1,
	DPad = 2,
	Thumbpad = 3,
	ClickToMove = 4,
	Scriptable = 5,
	DynamicThumbstick = 6,
})
