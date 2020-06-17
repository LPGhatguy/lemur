local rbxDebug = {}

rbxDebug.traceback = debug.traceback

rbxDebug.profilebegin = function()
end

rbxDebug.profileend = function()
end

-- debug.loadmodule will be added by createEnvironment since it needs access to
-- the environment.

return rbxDebug
