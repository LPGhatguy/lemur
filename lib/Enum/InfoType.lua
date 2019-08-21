local createEnum = import("../createEnum")

return createEnum("InfoType", {
	Asset = 0,
	Product = 1,
	GamePass = 2,
	Subscription = 3,
	Bundle = 4,
})
