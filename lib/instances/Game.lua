local BaseInstance = import("./BaseInstance")

local Game = BaseInstance:extend("DataModel")

function Game:init(instance)
	-- Late import here to avoid a circular reference
	local Instance = import("../Instance")

	Instance.new("AnalyticsService", instance)
	Instance.new("ContentProvider", instance)
	Instance.new("CoreGui", instance)
	Instance.new("GuiService", instance)
	Instance.new("HttpService", instance)
	Instance.new("LocalizationService", instance)
	Instance.new("NotificationService", instance)
	Instance.new("Players", instance)
	Instance.new("RunService", instance)
	Instance.new("ReplicatedStorage", instance)
	Instance.new("Stats", instance)
	Instance.new("TestService", instance)
	Instance.new("TextService", instance)
	Instance.new("TweenService", instance)
	Instance.new("UserInputService", instance)
	Instance.new("VirtualInputManager", instance)
	Instance.new("Workspace", instance)
end

function Game.prototype:GetService(serviceName)
	local service = self:FindFirstChildOfClass(serviceName)

	if service then
		return service
	end

	-- TODO: Load the service if possible?

	error(string.format("Cannot get service %q", tostring(serviceName)), 2)
end

return Game