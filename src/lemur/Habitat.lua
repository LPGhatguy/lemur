--[[
	A Lemur Habitat is an instance of an emulated Roblox environment.

	It is the root instance of the emulated hierarchy.
]]

local Game = import("./Game")
local Instance = import("./Instance")
local environment = import("./environment")
local fs = import("./fs")

local function loadFromFs(path, rootInstance)
	for name in fs.dir(path) do
		-- Why are these even in the iterator?
		if name ~= "." and name ~= ".." then
			local childPath = path .. "/" .. name

			if fs.isFile(childPath) then
				if name:find("%.lua$") then
					local instance = Instance.new("ModuleScript", rootInstance)
					instance.Name = name:match("^(.-)%.lua$")
					local contents = assert(fs.read(childPath))

					instance.Source = contents
				end
			elseif fs.isDirectory(childPath) then
				local instance = Instance.new("Folder", rootInstance)
				instance.Name = name

				loadFromFs(childPath, instance)
			end
		end
	end
end

local Habitat = {}
Habitat.__index = Habitat

function Habitat.new(path)
	local habitat = {
		_path = path,
		game = nil,
	}

	setmetatable(habitat, Habitat)

	habitat.game = Game.new(habitat)

	local lemur = habitat.game:GetService("Lemur")

	loadFromFs(path, lemur)

	return habitat
end

function Habitat:isFile(path)
	local fullPath = self._path .. "/" .. path

	return fs.isFile(fullPath)
end

function Habitat:isDirectory(path)
	local fullPath = self._path .. "/" .. path

	return fs.isDirectory(fullPath)
end

function Habitat:_load(path)
	local fullPath = self._path .. "/" .. path

	return loadfile(fullPath)
end

--[[
	Equivalent to Roblox's 'require', called on an emulated Roblox instance.
]]
function Habitat:require(instance)
	local internalInstance = instance._internal
	if internalInstance._loaded then
		return internalInstance._result
	end

	local chunk = assert(loadstring(instance.Source, internalInstance._path))

	local env = environment.create(self, instance)
	setfenv(chunk, env)

	local result = chunk()

	internalInstance._loaded = true
	internalInstance._result = result

	return result
end

return Habitat