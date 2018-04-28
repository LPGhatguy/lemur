local Game = import("./Game")
local Instance = import("../Instance")

describe("instances.Game", function()
	it("should instantiate", function()
		local instance = Instance.new("Game")

		assert.not_nil(instance)
	end)

	describe("GetService", function()
		it("should have GetService", function()
			local instance = Game:new()

			local ReplicatedStorage = instance:GetService("ReplicatedStorage")

			assert.not_nil(ReplicatedStorage)
			assert.equal(instance.ReplicatedStorage, ReplicatedStorage)
		end)

		it("should throw when given invalid service names", function()
			local instance = Game:new()

			assert.has.errors(function()
				instance:GetService("SOMETHING THAT WILL NEVER EXIST")
			end)
		end)
	end)
end)