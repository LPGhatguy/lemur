local lemur = require("lemur")

describe("Lemur", function()
	it("should load modules directory", function()
		local habitat = lemur.Habitat.new("spec/require")
		local module = habitat.game:GetService("Lemur").a
		local value = habitat:require(module)

		assert.equal(value, "foo")
	end)

	it("should load modules from within folders", function()
		local habitat = lemur.Habitat.new("spec/require")
		local module = habitat.game:GetService("Lemur").foo
		local value = habitat:require(module)

		assert.equal(value, "qux")
	end)
end)