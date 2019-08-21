local createEnum = import("../createEnum")

return createEnum("ComputerMovementMode", {
	Default = 0,
	KeyboardMouse = 1,
	ClickToMove = 2,
})
