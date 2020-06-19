--[[
	A limited, simple implementation of a Signal.

	Handlers are fired in order, and (dis)connections are properly handled when
	executing an event.
]]

local assign = import("./assign")
local typeKey = import("./typeKey")

local function immutableAppend(list, ...)
	local new = {}
	local len = #list

	for key = 1, len do
		new[key] = list[key]
	end

	for i = 1, select("#", ...) do
		new[len + i] = select(i, ...)
	end

	return new
end

local function immutableRemoveValue(list, removeValue)
	local new = {}

	for i = 1, #list do
		if list[i] ~= removeValue then
			table.insert(new, list[i])
		end
	end

	return new
end

local connectionMetatable = {}
connectionMetatable[typeKey] = "RBXScriptConnection"

function connectionMetatable:__index(key)
	local internal = getmetatable(self).internal

	if internal[key] ~= nil then
		return internal[key]
	end

	error(string.format("%s is not a valid member of RBXScriptConnection", tostring(key)), 2)
end

local Signal = {}

Signal.__index = Signal

function Signal.new()
	local internal = {
		listeners = {},
	}

	local self = newproxy(true)
	getmetatable(self).__index = Signal
	getmetatable(self).internal = internal
	getmetatable(self)[typeKey] = "RBXScriptSignal"

	return self
end

function Signal:Connect(callback)
	local internal = getmetatable(self).internal

	internal.listeners = immutableAppend(internal.listeners, callback)

	local connection = newproxy(true)
	local instance = getmetatable(connection)
	instance.internal = {
		Connected = true
	}
	assign(instance, connectionMetatable)

	function instance.internal.Disconnect()
		instance.internal.Connected = false
		internal.listeners = immutableRemoveValue(internal.listeners, callback)
	end

	return connection
end

function Signal:Fire(...)
	-- TODO: Move this function somewhere else, since it isn't part of the
	-- public API that Roblox exposes.

	local internal = getmetatable(self).internal

	for _, listener in ipairs(internal.listeners) do
		-- Busted uses tables for spies, which angers coroutine.create if we use
		-- them directly.
		local co = coroutine.create(function(...)
			return listener(...)
		end)

		-- TODO: Report errors in a nice way that won't spam tests
		coroutine.resume(co, ...)
	end
end

function Signal:Wait()
	-- Once Lemur has an event loop, this can be revisited.
	error("Signal:Wait is not implemented in Lemur", 2)
end

function Signal:_DisconnectAllListeners()
	local internal = getmetatable(self).internal

	internal.listeners = {}
end

return Signal