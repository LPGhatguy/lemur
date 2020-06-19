local createEnum = import("../createEnum")

return createEnum("ExplosionType", {
	NoCraters = 0,
	Craters = 1,
	CratersAndDebris = 2,
})
