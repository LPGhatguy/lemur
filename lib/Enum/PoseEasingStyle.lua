local createEnum = import("../createEnum")

return createEnum("PoseEasingStyle", {
	Linear = 0,
	Constant = 1,
	Elastic = 2,
	Cubic = 3,
	Bounce = 4,
})
