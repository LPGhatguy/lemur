local createEnum = import("../createEnum")

return createEnum("RibbonTool", {
	Select = 0,
	Scale = 1,
	Rotate = 2,
	Move = 3,
	Transform = 4,
	ColorPicker = 5,
	MaterialPicker = 6,
	Group = 7,
	Ungroup = 8,
	None = 9,
})
