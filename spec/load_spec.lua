package.path = "./?/init.lua;" .. package.path
local lemur = require("lib")

describe("Lemur", function()
	it("should load folders correctly", function()
		local habitat = lemur.Habitat:new()

		local root = habitat:loadFromFs("spec/test-project")

		assert.equal(#root:GetChildren(), 6)

		local bar = root:FindFirstChild("bar")
		assert.equal(bar.ClassName, "ModuleScript")
		assert.equal(bar.Source, "-- bar.lua")

		local usurp = root:FindFirstChild("usurp")
		assert.equal(#usurp:GetChildren(), 1)
		assert.equal(usurp.ClassName, "ModuleScript")
		assert.equal(usurp.Source, "-- init.lua")

		local foo = usurp:FindFirstChild("foo")
		assert.equal(foo.ClassName, "ModuleScript")
		assert.equal(foo.Source, "-- foo.lua")

		local normal = root:FindFirstChild("normal-folder")
		assert.equal(#normal:GetChildren(), 1)
		assert.equal(normal.ClassName, "Folder")

		local ack = normal:FindFirstChild("ack")
		assert.equal(ack.ClassName, "ModuleScript")
		assert.equal(ack.Source, "-- ack.lua")

		local abc = root:FindFirstChild("abc")
		assert.equal(abc.ClassName, "Script")
		assert.equal(abc.Source, "-- abc.server.lua")

		local def = root:FindFirstChild("def")
		assert.equal(def.ClassName, "LocalScript")
		assert.equal(def.Source, "-- def.client.lua")

		local usurpServer = root:FindFirstChild("usurp-server")
		assert.equal(#usurpServer:GetChildren(), 0)
		assert.equal(usurpServer.ClassName, "Script")
		assert.equal(usurpServer.Source, "-- usurp-server/init.server.lua")
	end)

	it("should not touch init.lua if loadInitModules is false", function()
		local habitat = lemur.Habitat:new()

		local root = habitat:loadFromFs("spec/test-project", {
			loadInitModules = false,
		})

		assert.equal(#root:GetChildren(), 6)

		local usurp = root:FindFirstChild("usurp")
		assert.equal(usurp.ClassName, "Folder")

		local init = usurp:FindFirstChild("init")
		assert.equal(init.ClassName, "ModuleScript")
		assert.equal(init.Source, "-- init.lua")

		local foo = usurp:FindFirstChild("foo")
		assert.equal(foo.ClassName, "ModuleScript")
		assert.equal(foo.Source, "-- foo.lua")

		local abc = root:FindFirstChild("abc")
		assert.equal(abc.ClassName, "Script")
		assert.equal(abc.Source, "-- abc.server.lua")

		local def = root:FindFirstChild("def")
		assert.equal(def.ClassName, "LocalScript")
		assert.equal(def.Source, "-- def.client.lua")

		local usurpServer = root:FindFirstChild("usurp-server")
		assert.equal(#usurpServer:GetChildren(), 1)
		assert.equal(usurpServer.ClassName, "Folder")
	end)
end)