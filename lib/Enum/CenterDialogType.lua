local createEnum = import("../createEnum")

return createEnum("CenterDialogType", {
	UnsolicitedDialog = 1,
	PlayerInitiatedDialog = 2,
	ModalDialog = 3,
	QuitDialog = 4,
})
