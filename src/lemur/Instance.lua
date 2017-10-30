local instances = import("./instances")
local Signal = import("./Signal")

local Instance = {}

Instance.properties = {}

Instance.properties.Parent = {
	get = function(self, key)
		return self._internal.parent
	end,
	set = function(self, key, value)
		local internal = self._internal
		if internal.parent == value then
			return
		end

		if internal.parent then
			internal.parent._internal.children[self] = nil
		end

		internal.parent = value

		if value then
			value._internal.children[self] = true
		end
	end,
}

Instance.properties.Name = {
	get = function(self, key)
		return self._internal.name
	end,
	set = function(self, key, value)
		self._internal.name = value
	end,
}

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
			properties = template.properties or {},
			children = {},
			parent = nil,
		},

		_isInstance = true,
		ClassName = name,
		Changed = Signal.new(),
	}

	setmetatable(new, Instance)

	new.Name = name

	-- TODO: The instance handle should be a userdata, not a table!

	if template.init then
		template.init(new)
	end

	if parent then
		new._internal.parent = parent
		parent._internal.children[new] = true
	end

	return new
end

function Instance:__tostring()
	return self.Name
end

function Instance:__index(key)
	local internal = self._internal

	if internal.template[key] then
		return internal.template[key]
	end

	if Instance[key] then
		return Instance[key]
	end

	if Instance.properties[key] then
		return Instance.properties[key].get(self, key)
	end

	if internal.properties[key] then
		return internal.properties[key].get(self, key)
	end

	local child = self:FindFirstChild(key)

	-- Roblox throws when accessing undefined keys
	if not child then
		error(string.format("%s is not a valid member of %s", key, self.ClassName), 2)
	end

	return child
end

function Instance:__newindex(key, value)
	if Instance.properties[key] then
		Instance.properties[key].set(self, key, value)

		self.Changed:Fire(key)

		return
	end

	local internal = self._internal
	if internal.properties[key] then
		internal.properties[key].set(self, key, value)

		self.Changed:Fire(key)

		return
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

function Instance:IsA(className)
	-- TODO: Hierarchy stuff

	return self.ClassName == className
end

function Instance:Destroy()
	self.Parent = nil

	-- TODO: Lock the parent!
end

return Instance