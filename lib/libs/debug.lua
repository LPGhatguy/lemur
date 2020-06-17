local rbxDebug = {}

rbxDebug.traceback = debug.traceback
rbxDebug.profilebegin = debug.profilebegin
rbxDebug.profileend = debug.profileend

-- debug.loadmodule will be added by createEnvironment since it needs access to
-- the environment.

return rbxDebug
