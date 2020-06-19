local createEnum = import("../createEnum")

return createEnum("ElasticBehavior", {
	WhenScrollable = 0,
	Always = 1,
	Never = 2,
})
