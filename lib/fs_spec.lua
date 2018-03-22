describe("fs", function()
	it("should error when lfs is not installed", function()
		--To successfully test this, I must do the grossest hack.
		local oldRequire = require

		_G.require = function(name)
			if name == "lfs" then
				error()
			else
				return oldRequire(name)
			end
		end

		assert.has.errors(function()
			import("./fs")
		end

		_G.require = oldRequire
	end)
end)
