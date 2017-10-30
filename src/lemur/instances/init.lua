local names = {
	"Game",

	-- Regular instances
	"Folder",
	"ModuleScript",
	"StringValue",
	"BoolValue",
	"ObjectValue",
	"IntValue",
	"Frame",
	"BindableEvent",

	-- Services
	"Lemur",
	"RunService",
	"CoreGui",
}

local instances = {}

for _, name in ipairs(names) do
	instances[name] = import("./" .. name)
end

return instances