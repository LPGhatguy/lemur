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

		it("should return an empty table if the string and sep is the empty string", function()
			assert.are.same({}, string.split("", ""))
		end)

		it("should return the original string in a table if no sep is matched", function()
			assert.are.same({"Hello, world"}, string.split("Hello, world", "K"))
			assert.are.same({""}, string.split("", " "))
		end)

		it("should return properly splitted strings", function()
			assert.are.same({"", "Validark", "Osyris", "Vorlias", ""}, string.split("/Validark/Osyris/Vorlias/", "/"))
			assert.are.same({"", "Validark", "Osyris", "Vorlias"}, string.split("/Validark/Osyris/Vorlias", "/"))
			assert.are.same({"Validark", "Osyris", "Vorlias", ""}, string.split("Validark/Osyris/Vorlias/", "/"))
			assert.are.same({"Validark", "Osyris", "Vorlias"}, string.split("Validark/Osyris/Vorlias", "/"))
		end)
	end)
end)
