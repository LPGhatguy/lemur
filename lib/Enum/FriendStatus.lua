local createEnum = import("../createEnum")

return createEnum("FriendStatus", {
	Unknown = 0,
	NotFriend = 1,
	Friend = 2,
	FriendRequestSent = 3,
	FriendRequestReceived = 4,
})
