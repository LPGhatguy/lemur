local Color3 = import("./Color3")

describe("types.Color3", function()
	it("should have a constructor", function()
		local color = Color3.new(0, 0, 0)

		assert.not_nil(color)
	end)
end)