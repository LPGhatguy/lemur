local CoreGui = import("./CoreGui")
local Instance = import("../Instance")

describe("instances.CoreGui", function()
	it("should instantiate", function()
		local instance = Instance.new("CoreGui")

		assert.not_nil(instance)
	end)

	it("should have a ScreenGui child named RobloxGui", function()
		local instance = CoreGui:new()

		local robloxGui = instance:FindFirstChild("RobloxGui")

		assert.not_nil(robloxGui)
		assert.equal(robloxGui.ClassName, "ScreenGui")
	end)
end)