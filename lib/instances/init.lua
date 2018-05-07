local names = {
	"Game",

	-- Regular instances
	"BindableEvent",
	"BoolValue",
	"Folder",
	"Frame",
	"IntValue",
	"LocalScript",
	"ModuleScript",
	"ObjectValue",
	"ScreenGui",
	"Script",
	"StringValue",

	-- Services
	"ContentProvider",
	"CoreGui",
	"GuiService",
	"HttpService",
	"LocalizationService",
	"Players",
	"ReplicatedStorage",
	"RunService",
	"Stats",
	"TestService",
	"TextService",
	"TweenService",
	"UserInputService",
}

local instances = {}

for _, name in ipairs(names) do
	instances[name] = import("./" .. name)
end

return instances