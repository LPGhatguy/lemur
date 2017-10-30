local instances = import("./instances")

local Instance = {}

function Instance.new(name, parent)
	local template = instances[name]

	if not template then
		error(string.format("Can't make an instance of type %q", tostring(name)), 2)
	end

	local new = {
		-- Any instance-specific internal values should be here.
		-- This lets us hide keys and check nil without bumping into __index.
		_internal = {
			template = template,
			children = {},
			parent = nil,
		},

		ClassName = name,
		Name = name,
		Parent = parent,
	}

	if parent then
		new._internal.parent = parent
		parent._internal.children[new] = true
	end

	setmetatable(new, Instance)

	-- TODO: The instance handle should be a userdata, not a table!

	if template.init then
		template.init(new)
	end

	return new
end

function Instance:__index(key)
	local internalInstance = self._internal

	if internalInstance.template[key] then
		return internalInstance.template[key]
	end

	if Instance[key] then
		return Instance[key]
	end

	-- 'Parent' is allowed to be nil
	if key == "Parent" then
		return internalInstance.parent
	end

	local child = self:FindFirstChild(key)

	-- Roblox throws when accessing undefined keys
	if not child then
		error(string.format("%s is not a valid member of %s", key, self.ClassName), 2)
	end

	return child
end

function Instance:__newindex(key, value)
	local internalInstance = self._internal

	if key == "Parent" then
		if internalInstance.parent == value then
			return
		end

		if internalInstance.parent then
			internalInstance.parent._internal.children[self] = nil
		end

		internalInstance.parent = value

		if value then
			value._internal.children[self] = true
		end
	end

	rawset(self, key, value)
end

function Instance:FindFirstChild(name)
	-- Search for existing children
	-- This is a set stored by child instead of by name, since names are not unique.
	for child in pairs(self._internal.children) do
		if child.Name == name then
			return child
		end
	end

	return nil
end

function Instance:GetChildren()
	local result = {}

	for child in pairs(self._internal.children) do
		table.insert(result, child)
	end

	return result
end

return Instance