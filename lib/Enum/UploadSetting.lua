local createEnum = import("../createEnum")

return createEnum("UploadSetting", {
	Never = 0,
	Ask = 1,
	Always = 2,
})
