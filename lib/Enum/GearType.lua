local createEnum = import("../createEnum")

return createEnum("GearType", {
	MeleeWeapons = 0,
	RangedWeapons = 1,
	Explosives = 2,
	PowerUps = 3,
	NavigationEnhancers = 4,
	MusicalInstruments = 5,
	SocialItems = 6,
	BuildingTools = 7,
	Transport = 8,
})
