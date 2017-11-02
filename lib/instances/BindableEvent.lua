local Signal = import("../Signal")

local BindableEvent = {}

function BindableEvent:init()
	self.Event = Signal.new()
end

function BindableEvent:Fire(...)
	self.Event:Fire(...)
end

return BindableEvent