local patching = require("lemur.patching")

return {
	patch = patching.patch,
	revert = patching.revert,
}