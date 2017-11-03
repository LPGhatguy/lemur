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

function Habitat:loadFromFs(path, rootInstance)
	for name in fs.dir(path) do
		-- Why are these even in the iterator?
		if name ~= "." and name ~= ".." then
			local childPath = path .. "/" .. name

			if fs.isFile(childPath) then
				if name:find("%.lua$") then
					local instance = Instance.new("ModuleScript", rootInstance)
					local contents = assert(fs.read(childPath))

					instance.Name = name:match("^(.-)%.lua$")
					instance.Source = contents
					instance._internal.path = childPath
				end
			elseif fs.isDirectory(childPath) then
				local instance = Instance.new("Folder", rootInstance)
				instance.Name = name

				self:loadFromFs(childPath, instance)
			end
		end
	end
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

	local internalInstance = instance._internal
	if internalInstance._loaded then
		return internalInstance._result
	end

	local chunk = assert(loadstring(instance.Source, "@" .. internalInstance.path))

	local env = environment.create(self, instance)
	setfenv(chunk, env)

	local result = chunk()

	internalInstance._loaded = true
	internalInstance._result = result

	return result
end

return Habitat