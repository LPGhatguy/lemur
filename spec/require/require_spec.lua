local lemur = require("lemur")

describe("Lemur", function()
	it("should allow loading Roblox-like modules", function()
		local habitat = lemur.Habitat.new("spec/require")
		local module = habitat.game:GetService("Lemur").a
		local value = habitat:require(module)

		assert.equal(value, "foo")
	end)
end)