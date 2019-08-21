local createEnum = import("../createEnum")

return createEnum("TextureQueryType", {
	NonHumanoid = 0,
	NonHumanoidOrphaned = 1,
	Humanoid = 2,
	HumanoidOrphaned = 3,
})
