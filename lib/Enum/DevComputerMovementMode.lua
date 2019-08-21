local createEnum = import("../createEnum")

return createEnum("DevComputerMovementMode", {
	UserChoice = 0,
	KeyboardMouse = 1,
	ClickToMove = 2,
	Scriptable = 3,
})
