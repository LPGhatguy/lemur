local names = {
	"Game",

	-- Regular instances
	"BindableEvent",
	"BoolValue",
	"Camera",
	"Folder",
	"Frame",
	"GuiObject",
	"GuiButton",
	"ImageButton",
	"ImageLabel",
	"IntValue",
	"LocalScript",
	"ModuleScript",
	"ObjectValue",
	"ScreenGui",
	"Script",
	"StringValue",
	"TextButton",
	"TextLabel",
	"UIListLayout",
	"UIPadding",
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