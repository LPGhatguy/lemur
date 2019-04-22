local BrickColor = import("./BrickColor")
local Color3 = import("./Color3")

local typeof = import("../functions/typeof")


describe("types.BrickColor", function()
	it("should have an empty constructor", function()
		local color = BrickColor.new()

		assert.not_nil(color)
		assert.are.same(1003, color.Number)
	end)

	it("should have a constructor that takes rgb values 0-1", function()
		local color = BrickColor.new(0, 0, 0)

		assert.not_nil(color)
	end)

	it("should have a constructor that takes a string name", function()
		local color = BrickColor.new("Medium stone grey")

		assert.not_nil(color)
		assert.are.same(194, color.Number)
	end)

	it("should have a constructor that takes a numerical index", function()
		local color = BrickColor.new(1)

		assert.not_nil(color)
		assert.are.same(1, color.Number)
	end)

	it("should have a constructor that takes a Color3", function()
		local color = BrickColor.new(Color3.new(0, 0, 0))

		assert.not_nil(color)
		assert.are.same(1003, color.Number)
	end)

	it("should map r g b values to the nearest BrickColor", function()
		local color = BrickColor.new(0.123, 0.123, 0.123)
		assert.not_nil(color)
		assert.are.same(149, color.Number)
	end)

	it("should have the palette method", function()
		local color = BrickColor.palette(0)

		assert.not_nil(color)
		assert.are.same(141, color.Number)
	end)

	it("should have the random method", function()
		local color = BrickColor.random()

		assert.not_nil(color)
	end)

	it("should have the White method", function()
		local color = BrickColor.White()

		assert.not_nil(color)
		assert.are.same(1, color.Number)
	end)

	it("should have the Gray method", function()
		local color = BrickColor.Gray()

		assert.not_nil(color)
		assert.are.same(194, color.Number)
	end)

	it("should have the DarkGray method", function()
		local color = BrickColor.DarkGray()

		assert.not_nil(color)
		assert.are.same(199, color.Number)
	end)

	it("should have the Black method", function()
		local color = BrickColor.Black()

		assert.not_nil(color)
		assert.are.same(26, color.Number)
	end)

	it("should have the Red method", function()
		local color = BrickColor.Red()

		assert.not_nil(color)
		assert.are.same(21, color.Number)
	end)

	it("should have the Green method", function()
		local color = BrickColor.Green()

		assert.not_nil(color)
		assert.are.same(28, color.Number)
	end)

	it("should have the Blue method", function()
		local color = BrickColor.Blue()

		assert.not_nil(color)
		assert.are.same(23, color.Number)
	end)

	it("should have the Yellow method", function()
		local color = BrickColor.Yellow()

		assert.not_nil(color)
		assert.are.same(24, color.Number)
	end)

	it("should compare BrickColors", function()
		local c1, c2 = BrickColor.new(1), BrickColor.new(1)
		assert.are.equal(c1, c2)
		assert.are_not_equal(c1, BrickColor.new(2))
	end)

	it("should be detected by typeof", function()
		local type = typeof(BrickColor.new())
		assert.are.equal("BrickColor", type)
	end)

	it("tostring should return 'BrickColor'", function()
		local typeString = tostring(BrickColor)

		assert.not_nil(typeString)
		assert.are.same(typeString, "BrickColor")
	end)

	it("should return color 'Medium stone grey' for invalid name", function()
		local color = BrickColor.new("")

		assert.not_nil(color)
		assert.are.same(194, color.Number)
	end)


	it("should return color 'Medium stone grey' for invalid number", function()
		local color = BrickColor.new(-1)

		assert.not_nil(color)
		assert.are.same(194, color.Number)
	end)

	it("should error when an invalid palette index is given", function()
		assert.has_error(
			function()
				BrickColor.palette()
			end,
			"Argument 1 missing or nil"
		)

		assert.has_error(
			function()
				BrickColor.palette(-1)
			end,
			"palette index out of bounds (-1)"
		)

		assert.has_error(
			function()
				BrickColor.palette("")
			end,
			"Unable to cast string to int"
		)
	end)

	it("should error when an invalid argument type is given", function()
		assert.has_error(
			function()
				BrickColor.new(true)
			end,
			"Bad argument #1 to 'new' (Color3 expected got boolean)"
		)
	end)
end)
