local ContextActionService = import("./ContextActionService")

describe("instances.ContextActionService", function()
	it("should instantiate", function()
		local instance = ContextActionService:new()

		assert.not_nil(instance)
	end)
end)