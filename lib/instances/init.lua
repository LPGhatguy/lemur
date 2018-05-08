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
	"Player",
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
	"NotificationService",
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