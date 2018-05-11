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
	"LocalizationTable",
	"LocalScript",
	"ModuleScript",
	"ObjectValue",
	"Player",
	"ScreenGui",
	"Script",
	"StringValue",
	"TextButton",
	"TextLabel",
	"UIGridStyleLayout",
	"UIListLayout",
	"UIPadding",
	"Workspace",

	-- Services
	"AnalyticsService",
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
	"VirtualInputManager",
}

local instances = {}

for _, name in ipairs(names) do
	instances[name] = import("./" .. name)
end

return instances