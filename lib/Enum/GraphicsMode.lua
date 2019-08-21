local createEnum = import("../createEnum")

return createEnum("GraphicsMode", {
	Automatic = 1,
	Direct3D9 = 3,
	Direct3D11 = 2,
	OpenGL = 4,
	Metal = 5,
	Vulkan = 6,
	NoGraphics = 7,
})
