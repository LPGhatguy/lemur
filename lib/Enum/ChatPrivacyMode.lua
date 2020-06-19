local createEnum = import("../createEnum")

return createEnum("ChatPrivacyMode", {
	AllUsers = 0,
	NoOne = 1,
	Friends = 2,
})
