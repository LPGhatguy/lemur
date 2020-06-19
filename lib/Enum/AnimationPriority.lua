local createEnum = import("../createEnum")

return createEnum("AnimationPriority", {
	Idle = 0,
	Movement = 1,
	Action = 2,
	Core = 1000,
})
