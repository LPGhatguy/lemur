local names = {
	"Game",

	-- Regular instances
	"BasePart",
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
	"Model",
	"ModuleScript",
	"NumberValue",
	"ObjectValue",
	"Player",
	"ScreenGui",
	"Script",
	"ScrollingFrame",
	"StringValue",
	"TextButton",
	"TextLabel",
	"UIGridStyleLayout",
	"UIListLayout",
	"UIPadding",
	"UITextSizeConstraint",
	"Vector3Value",
	"Workspace",

	-- Services
	"AnalyticsService",
	"ContentProvider",
	"CoreGui",
	"GuiService",
	"HttpService",
	"LocalizationService",
	"MarketplaceService",
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