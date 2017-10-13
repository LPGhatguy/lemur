local patching = require("lemur.patching")

local REPLACEMENTS = {"require", "game", "Instance"}

describe("patching", function()
	it("should replace and revert known values", function()
		local oldValues = {}
		for _, name in ipairs(REPLACEMENTS) do
			oldValues[name] = _G[name]
		end

		patching.patch()

		for _, name in ipairs(REPLACEMENTS) do
			assert.not_equal(oldValues[name], _G[name])
		end

		patching.revert()

		for _, name in ipairs(REPLACEMENTS) do
			assert.equal(oldValues[name], _G[name])
		end
	end)
end)