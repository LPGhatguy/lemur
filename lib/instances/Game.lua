local BaseInstance = import("./BaseInstance")

local AnalyticsService = import("./AnalyticsService")
local ContentProvider = import("./ContentProvider")
local CoreGui = import("./CoreGui")
local CorePackages = import("./CorePackages")
local Enum = import("../Enum")
local GuiService = import("./GuiService")
local HttpService = import("./HttpService")
local InstanceProperty = import("../InstanceProperty")
local LocalizationService = import("./LocalizationService")
local NotificationService = import("./NotificationService")
local Players = import("./Players")
local ReplicatedStorage = import("./ReplicatedStorage")
local RunService = import("./RunService")
local ServerScriptService = import("./ServerScriptService")
local Stats = import("./Stats")
local TestService = import("./TestService")
local TextService = import("./TextService")
local TweenService = import("./TweenService")
local UserInputService = import("./UserInputService")
local VirtualInputManager = import("./VirtualInputManager")
local Workspace = import("./Workspace")

local Game = BaseInstance:extend("DataModel")

function Game:init(instance)
	AnalyticsService:new().Parent = instance
	ContentProvider:new().Parent = instance
	CoreGui:new().Parent = instance
	CorePackages:new().Parent = instance
	GuiService:new().Parent = instance
	HttpService:new().Parent = instance
	LocalizationService:new().Parent = instance
	NotificationService:new().Parent = instance
	Players:new().Parent = instance
	ReplicatedStorage:new().Parent = instance
	RunService:new().Parent = instance
	ServerScriptService:new().Parent = instance
	Stats:new().Parent = instance
	TestService:new().Parent = instance
	TextService:new().Parent = instance
	TweenService:new().Parent = instance
	UserInputService:new().Parent = instance
	VirtualInputManager:new().Parent = instance
	Workspace:new().Parent = instance
end

function Game.prototype:GetService(serviceName)
	local service = self:FindFirstChildOfClass(serviceName)

	if service then
		return service
	end

	-- TODO: Load the service if possible?

	error(string.format("Cannot get service %q", tostring(serviceName)), 2)
end

Game.prototype.CreatorId = InstanceProperty.readOnly({
	getDefault = function()
		return 0
	end,
})

Game.prototype.CreatorType = InstanceProperty.readOnly({
	getDefault = function()
		return Enum.CreatorType.User
	end,
})

Game.prototype.GameId = InstanceProperty.readOnly({
	getDefault = function()
		return 0
	end,
})

Game.prototype.JobId = InstanceProperty.readOnly({
	getDefault = function()
		return ""
	end,
})

Game.prototype.PlaceId = InstanceProperty.readOnly({
	getDefault = function()
		return 0
	end,
})

Game.prototype.PlaceVersion = InstanceProperty.readOnly({
	getDefault = function()
		return 0
	end,
})

Game.prototype.VIPServerId = InstanceProperty.readOnly({
	getDefault = function()
		return ""
	end,
})

Game.prototype.VIPServerOwnerId = InstanceProperty.readOnly({
	getDefault = function()
		return 0
	end,
})

return Game