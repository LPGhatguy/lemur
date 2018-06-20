local ScrollingFrame = import("./ScrollingFrame")
local Vector2 = import("../types/Vector2")
local UDim2 = import("../types/UDim2")
local typeof = import("../functions/typeof")

describe("instances.ScrollingFrame", function()
	it("should instantiate", function()
		local instance = ScrollingFrame:new()

		assert.not_nil(instance)
	end)

	it("should have properties defined", function()
		local instance = ScrollingFrame:new()

		assert.equal(typeof(instance.CanvasSize), "UDim2")
		assert.equal(typeof(instance.ScrollBarThickness), "number")
		assert.equal(typeof(instance.ScrollingDirection), "number")
		assert.equal(typeof(instance.ScrollingEnabled), "boolean")
	end)

	describe("AbsoluteWindowSize", function()
		it("should include scrollbar width", function()
		end)
	end)
end)
