local Game = {}

function Game:init()
	local Instance = import("../Instance")

	self.ClassName = "DataModel"

	self._internal.services = {}

	self._internal.services.RunService = Instance.new("RunService", self)
	self._internal.services.Lemur = Instance.new("Lemur", self)
end

function Game:GetService(serviceName)
	if self._internal.services[serviceName] then
		return self._internal.services[serviceName]
	end

	error(string.format("Cannot get service %q", tostring(serviceName)), 2)
end

return Game