--[[
	A Lemur Habitat is an instance of an emulated Roblox environment.

	It is the root instance of the emulated hierarchy.
]]

local Instance = import("./Instance")
local environment = import("./environment")
local fs = import("./fs")

local Habitat = {}
Habitat.__index = Habitat

function Habitat.new()
	local habitat = {
		game = nil,
	}

	habitat.game = Instance.new("Game")

	setmetatable(habitat, Habitat)

	return habitat
end

function Habitat:loadFromFs(path)
	if fs.isFile(path) then
		if path:find("%.lua$") then
			local instance = Instance.new("ModuleScript")
			local contents = assert(fs.read(path))

			instance.Name = path:match("([^/]-)%.lua$")
			instance.Source = contents

			getmetatable(instance).instance.modulePath = path

			return instance
		end
	elseif fs.isDirectory(path) then
		local instance = Instance.new("Folder")
		instance.Name = path:match("([^/]-)$")

		for name in fs.dir(path) do
			-- Why are these even in the iterator?
			if name ~= "." and name ~= ".." then
				local childPath = path .. "/" .. name

				local childInstance = Habitat:loadFromFs(childPath)
				if childInstance then
					childInstance.Parent = instance
				end
			end
		end

		return instance
	end

	return nil
end

--[[
	Equivalent to Roblox's 'require', called on an emulated Roblox instance.
]]
function Habitat:require(instance)
	if not instance:IsA("ModuleScript") then
		local message = ("Attempted to require non-ModuleScript object %q (%s)"):format(
			instance.Name,
			instance.ClassName
		)
		error(message, 2)
	end

	local internalInstance = getmetatable(instance).instance
	if internalInstance.moduleLoaded then
		return internalInstance.moduleResult
	end

	local chunk = assert(loadstring(instance.Source, "@" .. internalInstance.modulePath))

	local env = environment.create(self, instance)
	setfenv(chunk, env)

	local result = chunk()

	internalInstance.moduleLoaded = true
	internalInstance.moduleResult = result

	return result
end

return Habitat