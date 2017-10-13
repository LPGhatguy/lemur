local Instance = require("lemur.Instance")

describe("Instance", function()
	it("should create instances of objects", function()
		local new = Instance.new("Folder")

		assert.not_nil(new)
	end)

	it("should error when given invalid instance names", function()
		assert.has.errors(function()
			Instance.new("ugh no")
		end)
	end)
end)