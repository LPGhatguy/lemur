local createEnum = import("../createEnum")

return createEnum("PacketPriority", {
	IMMEDIATE_PRIORITY = 0,
	HIGH_PRIORITY = 1,
	MEDIUM_PRIORITY = 2,
	LOW_PRIORITY = 3,
})
