local names = {
	-- Regular instances
	"Folder",
	"ModuleScript",

	-- Services
	"Lemur",
	"RunService",
}

local instances = {}

for _, name in ipairs(names) do
	instances[name] = require("lemur.instances." .. name)
end

return instances