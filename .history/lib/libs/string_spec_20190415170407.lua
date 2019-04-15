local string = import("./string")

describe("libs.string", function()
	describe("split", function()
		it("should be a function", function()
			assert.is_function(string.split)
		end)

		it("should return an array of comma separated strings if sep is nil", function()
			assert.are.same({"Hello", "world", "and", "lemur"}, string.split("Hello,world,and,lemur"))
		end)

		it("should return an array of all characters in a string if sep is the empty string", function()
			assert.are.same({"H", "e", "l", "l", "o", ",", "w", "o", "r", "l", "d", ",", "a", "n", "d", ",", "l", "e", "m", "u", "r"}, string.split("Hello,world,and,lemur", ""))
		end)

		it("should not clamp if value is between min and max", function()
			assert.are.equals(0.5, string.split(0.5, 0, 1))
		end)
	end)
end)
