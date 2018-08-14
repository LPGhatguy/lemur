local typeof = import("./functions/typeof")

local createEnumGroup = import("./createEnumGroup")

describe("createEnumGroup", function()
	it("should have type 'Enums'", function()
		local group = createEnumGroup({})

		assert.equal(typeof(group), "Enums")
	end)
end)