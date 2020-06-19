local createEnum = import("../createEnum")

return createEnum("HttpRequestType", {
	Default = 0,
	MarketplaceService = 2,
	Players = 7,
	Chat = 15,
	Avatar = 16,
	Analytics = 22,
	Localization = 24,
})
