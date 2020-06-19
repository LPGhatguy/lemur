local createEnum = import("../createEnum")

return createEnum("DraftStatusCode", {
	OK = 0,
	DraftOutdated = 1,
	ScriptRemoved = 2,
})
