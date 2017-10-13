local patching = require("patching")

return {
	patch = patching.patch,
	revert = patching.revert,
}