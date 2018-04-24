local names = {
	"Game",

	-- Regular instances
	"Folder",
	"ModuleScript",
	"Script",
	"LocalScript",
	"StringValue",
	"BoolValue",
	"ObjectValue",
	"IntValue",
	"Frame",
	"BindableEvent",
	"ScreenGui",

	-- Services
	"RunService",
	"CoreGui",
	"GuiService",
	"LocalizationService",
	"Players",
	"ReplicatedStorage",
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