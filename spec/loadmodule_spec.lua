package.path = "./?/init.lua;" .. package.path
local lemur = require("lib")

describe("Lemur", function()
	it("should load modules directly", function()
		local habitat = lemur.Habitat.new()

		local root = habitat:loadFromFs("spec/require")

		local module = root:FindFirstChild("a")

		assert.not_nil(module)

		local value = habitat:loadmodule(module)

		assert.equal(type(value), "function")

		assert.equal(value(), "foo")

		assert.equal(root:FindFirstChild("a"), module)
		assert.not_nil(root:FindFirstChild("b"))
	end)

	it("should load modules from within folders", function()
		local habitat = lemur.Habitat.new()

		local root = habitat:loadFromFs("spec/require")

		local value = habitat:loadmodule(root.foo)

		assert.equal(value(), "qux")
	end)

	it("should not keep a module cache", function()
		local habitat = lemur.Habitat.new()

		local root = habitat:loadFromFs("spec/require")

		local a = habitat:loadmodule(root.cacheme)
		local b = habitat:loadmodule(root.cacheme)

		assert.not_equal(a, b)
	end)

	it("should fail to load non-ModuleScripts", function()
		local habitat = lemur.Habitat.new()

		assert.has.errors(function()
			habitat:loadmodule(habitat.game)
		end)
	end)
end)