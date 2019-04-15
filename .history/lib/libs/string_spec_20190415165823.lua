local string = import("./string")

describe("libs.string", function()
	describe("split", function()
		it("should be a function", function()
			assert.is_function(string.split)
		end)

		it("should return an array of comma separated strings if sep is nil", function()
			assert.are.same({"Hello", "world"}, string.split("Hello,world"))
		end)

		it("should clamp if < min", function()
			assert.are.equals(0, string.split(-1, 0, 1))
		end)

		it("should not clamp if value is between min and max", function()
			assert.are.equals(0.5, string.split(0.5, 0, 1))
		end)
	end)
end)
