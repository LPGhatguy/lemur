local typeof = import("./functions/typeof")

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

	it("should contain all of the inputs", function()
		local bar = {}
		local group = createEnumGroup({
			foo = bar,
		})

		assert.equal(group.foo, bar)
	end)

	it("should throw when indexing with unknown keys", function()
		local group = createEnumGroup({})

		assert.has.errors(function()
			tostring(group.whatever)
		end)
	end)
end)