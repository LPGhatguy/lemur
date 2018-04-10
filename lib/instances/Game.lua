local BaseInstance = import("./BaseInstance")

local Game = BaseInstance:extend("DataModel")

function Game:init(instance)
	-- Late import here to avoid a circular reference
	local Instance = import("../Instance")

	Instance.new("RunService", instance)
	Instance.new("CoreGui", instance)
	Instance.new("ReplicatedStorage", instance)
	Instance.new("TestService", instance)
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