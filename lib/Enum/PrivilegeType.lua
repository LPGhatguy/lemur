local createEnum = import("../createEnum")

return createEnum("PrivilegeType", {
	Owner = 255,
	Admin = 240,
	Member = 128,
	Visitor = 10,
	Banned = 0,
})
