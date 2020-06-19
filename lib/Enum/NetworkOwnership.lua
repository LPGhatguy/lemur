local createEnum = import("../createEnum")

return createEnum("NetworkOwnership", {
	Automatic = 0,
	Manual = 1,
	OnContact = 2,
})
