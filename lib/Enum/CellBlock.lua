local createEnum = import("../createEnum")

return createEnum("CellBlock", {
	Solid = 0,
	VerticalWedge = 1,
	CornerWedge = 2,
	InverseCornerWedge = 3,
	HorizontalWedge = 4,
})
