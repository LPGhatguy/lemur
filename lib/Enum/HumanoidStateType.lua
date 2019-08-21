local createEnum = import("../createEnum")

return createEnum("HumanoidStateType", {
	FallingDown = 0,
	Running = 8,
	RunningNoPhysics = 10,
	Climbing = 12,
	StrafingNoPhysics = 11,
	Ragdoll = 1,
	GettingUp = 2,
	Jumping = 3,
	Landed = 7,
	Flying = 6,
	Freefall = 5,
	Seated = 13,
	PlatformStanding = 14,
	Dead = 15,
	Swimming = 4,
	Physics = 16,
	None = 18,
})
