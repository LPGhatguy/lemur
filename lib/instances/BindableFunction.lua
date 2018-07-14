local BaseInstance = import("./BaseInstance")
local InstanceProperty = import("../InstanceProperty")

local BindableFunction = BaseInstance:extend("BindableFunction", {
	creatable = true,
})

-- This isn't type checked because Roblox doesn't.
-- Instead, you just get a "attempt to call a [whatever] value" error when you :Invoke()
BindableFunction.properties.OnInvoke = InstanceProperty.writeOnly({
	getDefault = function()
		return nil
	end,
})

function BindableFunction.prototype:Invoke(...)
    local callback = getmetatable(self).instance.properties.OnInvoke

    -- BindableFunctions DON'T error if OnInvoke is nil, unlike every other type.
    if callback == nil then
        callback = function() end -- noop
    end

    -- Replicate Roblox behavior in that mixed tables will only send the numerical part
    local arguments = {...}

    for index,value in ipairs(arguments) do
        if type(value) == "table" then
            -- Check if a mixed table
            local numIndexes, numNamedKeys = #value, 0

            for _ in pairs(value) do
                numNamedKeys = numNamedKeys + 1
            end

            if numIndexes > 0 and numNamedKeys ~= numIndexes then
                -- Mixed table, only send numerical portion
                local newValue = {}

                for _,value2 in ipairs(value) do
                    table.insert(newValue, value2)
                end

                arguments[index] = newValue
            end
        end
    end

    callback(unpack(arguments))
end

return BindableFunction