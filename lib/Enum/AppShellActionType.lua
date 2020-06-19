local createEnum = import("../createEnum")

return createEnum("AppShellActionType", {
	None = 0,
	OpenApp = 1,
	TapChatTab = 2,
	TapConversationEntry = 3,
	TapAvatarTab = 4,
	ReadConversation = 5,
	TapGamePageTab = 6,
	TapHomePageTab = 7,
	GamePageLoaded = 8,
	HomePageLoaded = 9,
	AvatarEditorPageLoaded = 10,
})
