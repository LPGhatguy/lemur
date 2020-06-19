local createEnum = import("../createEnum")

return createEnum("PlayerActions", {
	CharacterForward = 0,
	CharacterBackward = 1,
	CharacterLeft = 2,
	CharacterRight = 3,
	CharacterJump = 4,
})
