local createEnum = import("../createEnum")

return createEnum("ProductPurchaseDecision", {
	NotProcessedYet = 0,
	PurchaseGranted = 1,
})
