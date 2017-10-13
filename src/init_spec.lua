local lemur = require("init")

describe("init", function()
	it("should load", function()
		assert.not_nil(lemur)
	end)
end)