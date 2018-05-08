local BaseInstance = import("./BaseInstance")
local InstanceProperty = import("../InstanceProperty")
local Signal = import("../Signal")

local VirtualInputManager = BaseInstance:extend("VirtualInputManager")

VirtualInputManager.properties.AdditionalLuaState = InstanceProperty.normal({
	getDefault = function()
		return ""
	end,
})

VirtualInputManager.properties.PlaybackCompleted = InstanceProperty.readOnly({
	getDefault = function()
		return Signal.new()
	end,
})

VirtualInputManager.properties.RecordingCompleted = InstanceProperty.readOnly({
	getDefault = function()
		return Signal.new()
	end,
})

function VirtualInputManager.prototype:Dump()
end

function VirtualInputManager.prototype:StartRecording()
end

function VirtualInputManager.prototype:StartPlaying(filename)
end

function VirtualInputManager.prototype:StopRecording()
end

return VirtualInputManager