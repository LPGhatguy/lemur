local lemur = require("lemur")

describe("Lemur", function()
	it("should load modules directory", function()
		local habitat = lemur.Habitat.new("spec/require")
		local module = habitat.game:GetService("Lemur"):FindFirstChild("a")

		assert.not_nil(module)

		local value = habitat:require(module)

		assert.equal(value, "foo")

		local children = habitat.game:GetService("Lemur")

		assert.equal(children:FindFirstChild("a"), module)
		assert.not_nil(children:FindFirstChild("b"))
	end)

	it("should load modules from within folders", function()
		local habitat = lemur.Habitat.new("spec/require")
		local module = habitat.game:GetService("Lemur").foo
		local value = habitat:require(module)

		assert.equal(value, "qux")
	end)

	it("should keep a module cache", function()
		local habitat = lemur.Habitat.new("spec/require")
		local module = habitat.game:GetService("Lemur").cacheme

		local a = habitat:require(module)
		local b = habitat:require(module)

		assert.equal(a, b)
	end)

	it("should fail to find non-existent modules", function()
		local habitat = lemur.Habitat.new("spec/require")

		local function nop()
		end

		assert.has.errors(function()
			nop(habitat.game:GetService("Lemur").NOPE_NOT_HERE)
		end)

		local object = habitat.game:GetService("Lemur"):FindFirstChild("STILL_NOT_HERE")

		assert.is_nil(object)
	end)
end)