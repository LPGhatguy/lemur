local Instance = import("../Instance")
local typeof = import("../functions/typeof")

describe("instances.Workspace", function()
	it("should instantiate", function()
		local instance = Instance.new("Workspace")

		assert.not_nil(instance)
	end)

	describe("CurrentCamera", function()
		it("should be an object of type Camera", function()
			local instance = Instance.new("Workspace")
			assert(typeof(instance.CurrentCamera), "Camera")
		end)

		it("should be accessible as a child named Camera", function()
			local instance = Instance.new("Workspace")
			assert.equals(instance.CurrentCamera, instance:WaitForChild("camera"))
		end)
	end)
end)