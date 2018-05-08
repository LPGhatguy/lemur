local VirtualInputManager = import("./VirtualInputManager")
local typeof = import("../functions/typeof")

describe("instances.VirtualInputManager", function()
	it("should instantiate", function()
		local instance = VirtualInputManager:new()

		assert.not_nil(instance)
	end)

	it("should have properties", function()
		local instance = VirtualInputManager:new()

		assert.equals(typeof(instance.AdditionalLuaState), "string")
		assert.not_nil(instance.PlaybackCompleted)
		assert.not_nil(instance.RecordingCompleted)
	end)

	it("should have methods defined that no-op", function()
		local instance = VirtualInputManager:new()

		instance:Dump()
		instance:StartRecording()
		instance:StartPlaying("test")
		instance:StopRecording()
	end)
end)