local instances = import("./instances")
local Signal = import("./Signal")

local Instance = {}

function Instance.InternalProperty(key)
	return {
		get = function(self)
			return self._internal[key]
		end,
		set = function(self, _, value)
			self._internal[key] = value
		end,
	}
end

function Instance.InternalPropertyReadonly(key)
	return {
		get = function(self)
			return self._internal[key]
		end,
		set = function(self)
			error(string.format("Unable to assign property %s. Script write access is restricted.", key))
		end
	}
end

Instance.properties = {}

Instance.properties.Name = Instance.InternalProperty("name")
Instance.properties.ClassName = Instance.InternalPropertyReadonly("className")

Instance.properties.Parent = {
	get = function(self, key)
		return self._internal.parent
	end,
	set = function(self, key, value)
		local internal = self._internal

		if internal.destroyed then
			error("Attempt to set parent after being destroyed!")
		end

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
			className = name,
			propertyListeners = {},
		},

		_isInstance = true,
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
		self:_PropertyChanged(key)
		return
	end

	local internal = self._internal
	if internal.properties[key] then
		internal.properties[key].set(self, key, value)
		self:_PropertyChanged(key)
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
	for child in pairs(self._internal.children) do
		child:Destroy()
	end

	if self.Parent then
		self.Parent = nil
	end

	self._internal.destroyed = true
end

--[[
	Note: In real Roblox, the Signal would be named PropertyNameChanged.
	Lemur signals do not have names, so this behavior is not recreated.
--]]
function Instance:GetPropertyChangedSignal(key)
	local listener = self._internal.propertyListeners[key]

	if not listener then
		assert(self.properties[key], key .. " is not a valid property name.")

		listener = Signal.new()
		self._internal.propertyListeners[key] = listener
	end

	return listener
end

function Instance:_PropertyChanged(key)
	self.Changed:Fire(key)

	local changedSignal = self._internal.propertyListeners[key]

	if changedSignal then
		changedSignal:Fire()
	end
end

return Instance