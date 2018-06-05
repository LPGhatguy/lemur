--[[
	A limited, simple implementation of a Signal.

	Handlers are fired in order, and (dis)connections are properly handled when
	executing an event.
]]

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

local Signal = {}

Signal.__index = Signal

function Signal.new()
	local internal = {
		listeners = {},
	}

	local self = newproxy(true)
	getmetatable(self).__index = Signal
	getmetatable(self).internal = internal
	getmetatable(self).type = "RBXScriptSignal"

	return self
end

function Signal:Connect(callback)
	local internal = getmetatable(self).internal

	internal.listeners = immutableAppend(internal.listeners, callback)

	local function disconnect()
		internal.listeners = immutableRemoveValue(internal.listeners, callback)
	end

	return {
		Disconnect = disconnect
	}
end

function Signal:Fire(...)
	-- TODO: Move this function somewhere else, since it isn't part of the
	-- public API that Roblox exposes.

	local internal = getmetatable(self).internal

	for _, listener in ipairs(internal.listeners) do
		listener(...)
	end
end

function Signal:Wait()
	-- Once Lemur has an event loop, this can be revisited.
	error("Signal:Wait is not implemented in Lemur", 2)
end

return Signal