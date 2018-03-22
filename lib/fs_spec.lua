local baste = require("lib.baste")

describe("fs", function()
	it("should error when lfs is not installed", function()
		--To successfully test this, I must do the grossest hack.
		local oldRequire = require

		--Bypass baste cache checks
		local oldJoin = baste._path.join

		baste._path.join = function(current, name)
			return "./" .. oldJoin(current, name)
		end

		_G.require = function(name)
			if name == "lfs" then
				error()
			else
				return oldRequire(name)
			end
		end

		assert.has.errors(function()
			import("./fs.lua")
		end)

		_G.require = oldRequire
		baste._path.join = oldJoin
	end)

	local fs = import("./fs")

	it("should return errors when failing to open a file", function()
		local contents, err = fs.read("nuclear launch codes.txt")

		assert.is_nil(contents)
		assert.is_not_nil(err)
	end)

	it("should return contents of files read", function()
		local contents, err = fs.read("init.lua")

		assert.is_not_nil(contents)
		assert.is_nil(err)
		assert.is_true(#contents > 0)
	end)
end)
