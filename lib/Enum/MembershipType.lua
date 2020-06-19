local createEnum = import("../createEnum")

return createEnum("MembershipType", {
	None = 0,
	BuildersClub = 1,
	TurboBuildersClub = 2,
	OutrageousBuildersClub = 3,
	Premium = 4,
})
