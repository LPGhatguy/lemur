local Game = require("src.Game")

describe("Game", function()
	it("is instantiable", function()
		local game = Game.new()

		assert.not_nil(game)
	end)

	it("has GetService", function()
		local game = Game.new()

		assert.not_nil(game.GetService)
		assert.not_nil(game:GetService("RunService"))
		assert.has.errors(function()
			game:GetService("sdfjio")
		end)
	end)
end)