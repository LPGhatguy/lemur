local createEnum = import("../createEnum")

return createEnum("FriendRequestEvent", {
	Issue = 0,
	Revoke = 1,
	Accept = 2,
	Deny = 3,
})
