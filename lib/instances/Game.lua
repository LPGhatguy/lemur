local Game = {}

function Game:init()
	local Instance = import("../Instance")

	self.ClassName = "DataModel"

	Instance.new("RunService", self)
	Instance.new("CoreGui", self)
	Instance.new("ReplicatedStorage", self)
	Instance.new("TestService", self)
end

function Game:GetService(serviceName)
	local service = self:FindFirstChild(serviceName)
	if service then
		return service
	end

	-- TODO: Load the service if possible?

	error(string.format("Cannot get service %q", tostring(serviceName)), 2)
end

return Game