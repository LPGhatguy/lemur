local createEnum = import("../createEnum")

return createEnum("ChatCallbackType", {
	OnCreatingChatWindow = 1,
	OnClientSendingMessage = 2,
	OnClientFormattingMessage = 3,
	OnServerReceivingMessage = 17,
})
