return function(f, ...)
	return coroutine.resume(coroutine.create(function(...)
		-- coroutine.create gets mad if it's not a *real* Lua function
		return f(...)
	end), ...)
end
