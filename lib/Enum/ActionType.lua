local createEnum = import("../createEnum")

return createEnum("ActionType", {
	Nothing = 0,
	Pause = 1,
	Lose = 2,
	Draw = 3,
	Win = 4,
})
