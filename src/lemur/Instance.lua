local instances = require("lemur.instances")

local Instance = {}

function Instance.new(name, parent)
	local template = instances[name]

	if not template then
		error(string.format("Can't make an instance of type %q", tostring(name)), 2)
	end

	local new = {
		_children = {},

		ClassName = name,
		Name = name,
		Parent = parent,
	}

	if parent and parent._children then
		parent._children[new] = true
	end

	setmetatable(new, Instance)

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

	return self:FindFirstChild(key)
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

	-- ...check to see if there's a script here on the filesystem
	local childPath = self:_getChildPath(name .. ".lua")
	local exists = lemur.habitat:fileExists(childPath)

	-- TODO: check for a folder instead!

	if not exists then
		return nil
	end

	-- ...and create a ModuleScript that represents it!
	local instance = Instance.new("ModuleScript", self)
	instance._path = childPath
	instance._habitat = lemur.habitat

	return instance
end

function Instance:GetChildren()
	error("GetChildren is not implemented.", 2)
end

return Instance