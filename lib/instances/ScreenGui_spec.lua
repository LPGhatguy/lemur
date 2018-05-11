local ScreenGui = import("./ScreenGui")
local typeof = import("../functions/typeof")

describe("instances.ScreenGui", function()
	it("should instantiate", function()
		local instance = ScreenGui:new()

		assert.not_nil(instance)
	end)

	describe("DisplayOrder", function()
		it("should have a value that is a number", function()
			local instance = ScreenGui:new()
			assert.equals(type(instance.DisplayOrder), "number")
		end)

		it("should be settable", function()
			local instance = ScreenGui:new()
			instance.DisplayOrder = 2
			assert.equals(instance.DisplayOrder, 2)
		end)

		it("should only accept numbers", function()
			local instance = ScreenGui:new()
			assert.has.errors(function()
				instance.DisplayOrder = "string"
			end)
		end)
	end)

	describe("AbsoluteSize", function()
		it("should return a Vector2", function()
			local instance = ScreenGui:new()
			assert.equals(typeof(instance.AbsoluteSize), "Vector2")
		end)
	end)
end)