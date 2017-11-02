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
	"RunService",
	"CoreGui",
	"ReplicatedStorage",
	"TestService",
}

local instances = {}

for _, name in ipairs(names) do
	instances[name] = import("./" .. name)
end

return instances