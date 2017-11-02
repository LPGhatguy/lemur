package.path = "./?/init.lua;" .. package.path
local lemur = require("lib")

describe("Lemur", function()
	it("should load modules directly", function()
		local habitat = lemur.Habitat.new()
		local ReplicatedStorage = habitat.game:GetService("ReplicatedStorage")

		habitat:loadFromFs("spec/require", ReplicatedStorage)

		local module = ReplicatedStorage:FindFirstChild("a")

		assert.not_nil(module)

		local value = habitat:require(module)

		assert.equal(value, "foo")

		local children = ReplicatedStorage

		assert.equal(children:FindFirstChild("a"), module)
		assert.not_nil(children:FindFirstChild("b"))
	end)

	it("should load modules from within folders", function()
		local habitat = lemur.Habitat.new()
		local ReplicatedStorage = habitat.game:GetService("ReplicatedStorage")

		habitat:loadFromFs("spec/require", ReplicatedStorage)

		local module = ReplicatedStorage.foo
		local value = habitat:require(module)

		assert.equal(value, "qux")
	end)

	it("should keep a module cache", function()
		local habitat = lemur.Habitat.new()
		local ReplicatedStorage = habitat.game:GetService("ReplicatedStorage")

		habitat:loadFromFs("spec/require", ReplicatedStorage)

		local module = ReplicatedStorage.cacheme

		local a = habitat:require(module)
		local b = habitat:require(module)

		assert.equal(a, b)
	end)

	it("should fail to find non-existent modules", function()
		local habitat = lemur.Habitat.new()
		local ReplicatedStorage = habitat.game:GetService("ReplicatedStorage")

		habitat:loadFromFs("spec/require", ReplicatedStorage)

		local function nop()
		end

		assert.has.errors(function()
			nop(ReplicatedStorage.NOPE_NOT_HERE)
		end)

		local object = ReplicatedStorage:FindFirstChild("STILL_NOT_HERE")

		assert.is_nil(object)
	end)
end)