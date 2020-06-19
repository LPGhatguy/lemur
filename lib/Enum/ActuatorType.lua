local createEnum = import("../createEnum")

return createEnum("ActuatorType", {
	None = 0,
	Motor = 1,
	Servo = 2,
})
