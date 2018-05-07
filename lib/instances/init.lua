local names = {
	"Game",

	-- Regular instances
	"BindableEvent",
	"BoolValue",
	"Camera",
	"Folder",
	"Frame",
	"GuiObject",
	"IntValue",
	"LocalScript",
	"ModuleScript",
	"ObjectValue",
	"ScreenGui",
	"Script",
	"StringValue",
	"Workspace",

	-- Services
	"ContentProvider",
	"CoreGui",
	"GuiService",
	"HttpService",
	"LocalizationService",
	"Players",
	"ReplicatedStorage",
	"RunService",
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