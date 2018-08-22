local typeof = import("./functions/typeof")
local createEnum = import("./createEnum")

local createEnumGroup = import("./createEnumGroup")

describe("createEnumGroup", function()
	it("should stringify as 'Enums'", function()
		local group = createEnumGroup({})

		assert.equal(tostring(group), "Enums")
	end)

	it("should have type 'Enums'", function()
		local group = createEnumGroup({})

		assert.equal(typeof(group), "Enums")
	end)

	it("should contain all input enums", function()
		local Foo = createEnum("Foo", {})
		local group = createEnumGroup({
			Foo = Foo,
		})

		assert.equal(group.Foo, Foo)
	end)

	it("should throw when passing non-enum values in", function()
		assert.has.errors(function()
			createEnumGroup({
				something = {},
			})
		end)
	end)

	it("should throw when indexing with unknown keys", function()
		local group = createEnumGroup({})

		assert.has.errors(function()
			tostring(group.whatever)
		end)
	end)

	it("should return enum items with GetEnumItems", function()
		local Foo = createEnum("Foo", {
			Doge = 1,
			Funny = 2,
		})

		local enumItems = Foo:GetEnumItems()
		assert.equal(#enumItems, 2)
		
		local enumItemDoge = enumItems[1]
		assert.equal(enumItemDoge.Name, "Doge")
		assert.equal(enumItemDoge.Value, 1)

		local enumItemFunny = enumItems[2]
		assert.equal(enumItemFunny.Name, "Funny")
		assert.equal(enumItemFunny.Value, 2)
	end)
end)