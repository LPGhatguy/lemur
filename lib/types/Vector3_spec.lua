local Vector3 = import("./Vector3")

local function extractValues(v)
	return { v.X, v.Y, v.Z }
end

describe("types.Vector3", function()
	it( "should have an empty constructor", function()
		local v = Vector3.new()

		assert.not_nil(v)
		assert.are.same({0, 0, 0}, extractValues(v))
	end)

	it("should have a constructor with three parameters", function()
		local v = Vector3.new(1, 2, 3)

		assert.not_nil(v)
		assert.are.same({1, 2, 3}, extractValues(v))
	end)

	it("should throw when bad params are passed to the constructor", function()
		assert.has.errors(function()
			Vector3.new(1, 2, "test")
		end)

		assert.has.errors(function()
			Vector3.new(1, "test", 3)
		end)

		assert.has.errors(function()
			Vector3.new("test", 2, 3)
		end)
	end)

	it("should add another Vector3", function()
		local vectorA = Vector3.new(1, 50, 200)
		local vectorB = Vector3.new(100, 300, 500)
		local v = vectorA + vectorB

		assert.not_nil(v)
		assert.are.same({101, 350, 700}, extractValues(v))
	end)

	it("should subtract another Vector3", function()
		local vectorA = Vector3.new(1, 50, 200)
		local vectorB = Vector3.new(100, 300, 500)
		local v = vectorA - vectorB

		assert.not_nil(v)
		assert.are.same({-99, -250, -300}, extractValues(v))
	end)

	it("should equal another Vector3 with the same x and y", function()
		local vectorA = Vector3.new(1, 200, 400)
		local vectorB = Vector3.new(1, 200, 400)

		assert.equals(vectorA, vectorB)
	end)

	it("should not equal another Vector3 with different x, y or z values", function()
		local vectorA = Vector3.new(1, 200, 500)
		local vectorB1 = Vector3.new(1, 200, 3)
		local vectorB2 = Vector3.new(1, 3, 500)
		local vectorB3 = Vector3.new(100, 200, 500)

		assert.not_equals(vectorA, vectorB1)
		assert.not_equals(vectorA, vectorB2)
		assert.not_equals(vectorA, vectorB3)
	end)

	it("should throw when accessing an invalid member", function()
		assert.has.errors(function()
			local v = Vector3.new()
			v.frobulations = v.frobulations + 1
		end)
	end)

	it("should have a string representation of \"Vector3\"", function()
		assert.equal(tostring(Vector3), "Vector3")
	end)
end)
