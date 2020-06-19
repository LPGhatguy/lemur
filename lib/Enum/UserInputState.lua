local createEnum = import("../createEnum")

return createEnum("UserInputState", {
	Begin = 0,
	Change = 1,
	End = 2,
	Cancel = 3,
	None = 4,
})
