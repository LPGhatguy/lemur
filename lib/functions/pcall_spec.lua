local pcall = import("./pcall")

local function fine(...)
	return "this", "is", "fine", ...
end

local function throws()
	error("you shouldn't see this error :(")
end

describe("functions.pcall", function()
	it("catches errors", function()
		local success, problem = pcall(throws)
		assert.False(success)
		assert.truthy(problem:match("you shouldn't see this error"))
	end)

	it("returns true and the return values if it doesn't error", function()
		assert.are.same({ pcall(fine) }, { true, "this", "is", "fine" })
	end)

	it("should take arguments", function()
		assert.are.same({ pcall(fine, "a", "b") }, { true, "this", "is", "fine", "a", "b" })
	end)

	it("should be able to yield", function()
		local f = coroutine.wrap(function(...)
			return pcall(function(...)
				return coroutine.yield(...)
			end, ...)
		end)
		assert.are.same({ f("doge") }, { true, "doge" })
	end)
end)
