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
	instances[name] = import("./" .. name)
end

return instances