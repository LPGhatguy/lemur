local Instance = import("../Instance")

describe("instances.ScreenGui", function()
	it("should instantiate", function()
		local instance = Instance.new("ScreenGui")

		assert.not_nil(instance)
	end)

	describe("DisplayOrder", function()
		it("should have a value that is a number", function()
			local instance = Instance.new("ScreenGui")
			assert.equals(type(instance.DisplayOrder), "number")
		end)

		it("should be settable", function()
			local instance = Instance.new("ScreenGui")
			instance.DisplayOrder = 2
			assert.equals(instance.DisplayOrder, 2)
		end)

		it("should only accept numbers", function()
			local instance = Instance.new("ScreenGui")
			assert.has.errors(function()
				instance.DisplayOrder = 2
			end)
		end)
	end)
end)