local createEnum = import("../createEnum")

return createEnum("FunctionalTestResult", {
	Passed = 0,
	Warning = 1,
	Error = 2,
})
