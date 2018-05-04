local Instance = import("../Instance")

describe("instances.Players", function()
	it("should instantiate", function()
		local instance = Instance.new("Players")

		assert.not_nil(instance)
	end)

	describe("NumPlayers", function()
		it("should equal 1", function()
			local instance = Instance.new("Players")
			assert.equals(instance.NumPlayers, 1)
		end)

		it("should be read-only", function()
			local instance = Instance.new("Players")
			assert.has.errors(function()
				instance.NumPlayers = 2
			end)
		end)
	end)
end)