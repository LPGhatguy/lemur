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

    callback(...)
end

return BindableFunction