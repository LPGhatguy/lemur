local createEnum = import("../createEnum")

return createEnum("RenderPriority", {
	First = 0,
	Input = 100,
	Camera = 200,
	Character = 300,
	Last = 2000,
})
