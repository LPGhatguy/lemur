local createEnum = import("../createEnum")

return createEnum("FormFactor", {
	Symmetric = 0,
	Brick = 1,
	Plate = 2,
	Custom = 3,
})
