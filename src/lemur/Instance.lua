local instances = import("./instances")

local Instance = {}

function Instance.new(name, parent)
	local template = instances[name]

	if not template then
		error(string.format("Can't make an instance of type %q", tostring(name)), 2)
	end

	local new = {
		_children = {},

		-- Any instance-specific internal values should be here.
		-- This lets us hide keys and check nil without bumping into __index.
		_internal = {},

		ClassName = name,
		Name = name,
		Parent = parent,
	}

	if parent and parent._children then
		parent._children[new] = true
	end

	setmetatable(new, Instance)

	-- TODO: The instance handle should be a userdata, not a table!

	if template.init then
		template.init(new)
	end

	return new
end

function Instance:__index(key)
	if Instance[key] then
		return Instance[key]
	end

	-- 'Parent' is allowed to be nil
	if key == "Parent" then
		return nil
	end

	local child = self:FindFirstChild(key)

	-- Roblox throws when accessing undefined keys
	if not child then
		error(string.format("%s is not a valid member of %s", key, self.ClassName), 2)
	end

	return child
end

--[[
	Crawl up the tree to locate the 'Lemur' service, where all code is mounted.
]]
function Instance:_findLemur()
	local current = self

	while current and current.ClassName ~= "Lemur" do
		current = current.Parent
	end

	return current
end

function Instance:_getChildPath(name)
	local piecePath = {}
	local current = self

	while true do
		if not current then
			break
		end

		if current.ClassName == "Lemur" then
			break
		end

		table.insert(piecePath, current.Name)

		current = current.Parent
	end

	table.insert(piecePath, name)

	return table.concat(piecePath, "/")
end

function Instance:FindFirstChild(name)
	-- Search for existing children
	-- This is a set stored by child instead of by name, since names are not unique.
	for child in pairs(self._children) do
		if child.Name == name then
			return child
		end
	end

	-- If we're inside the 'Lemur' service inside a Habitat...
	local lemur = self:_findLemur()

	if not lemur then
		return nil
	end

	-- Check for either a Lua script or a folder on the filesystem
	local filePath = self:_getChildPath(name .. ".lua")
	local directoryPath = self:_getChildPath(name)

	if lemur.habitat:isFile(filePath) then
		-- Create a ModuleScript to represent this!
		local instance = Instance.new("ModuleScript", self)
		instance.Name = name
		instance._internal._path = filePath
		instance._internal._habitat = lemur.habitat

		return instance
	elseif lemur.habitat:isDirectory(directoryPath) then
		-- Create a Folder to represent this!
		local instance = Instance.new("Folder", self)
		instance.Name = name

		return instance
	else
		-- Either there's nothing here, or something we don't recognize.
		return nil
	end
end

function Instance:GetChildren()
	error("GetChildren is not implemented.", 2)
end

return Instance