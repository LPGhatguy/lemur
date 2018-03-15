local warn = import("./warn")

describe("functions.warn", function()
	it("should be a function", function()
		assert.is_function(warn)
	end)

	it("should warn", function()
	   local oldErr = io.stderr

	   local writeSpy = spy.new(function(_, msg) end)

	   io.stderr = { -- luacheck: ignore
	       write = writeSpy
	   }

	   warn("Doge has taken over the world!")

	   assert.spy(writeSpy).was_called_with(io.stderr, "Doge has taken over the world!")

	   io.stderr = oldErr -- luacheck: ignore
	end)
end)