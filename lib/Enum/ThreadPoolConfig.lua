local createEnum = import("../createEnum")

return createEnum("ThreadPoolConfig", {
	Auto = 0,
	PerCore1 = 101,
	PerCore2 = 102,
	PerCore3 = 103,
	PerCore4 = 104,
	Threads1 = 1,
	Threads2 = 2,
	Threads3 = 3,
	Threads4 = 4,
	Threads8 = 8,
	Threads16 = 16,
})
