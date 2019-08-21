local createEnum = import("../createEnum")

return createEnum("ErrorReporting", {
	DontReport = 0,
	Prompt = 1,
	Report = 2,
})
