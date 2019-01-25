-- pcall in Lua 5.1 cannot yield, this is a patch for that

return function(f, ...)
	return coroutine.resume(coroutine.create(function(...)
		-- coroutine.create gets mad if it's not a *real* Lua function
		return f(...)
	end), ...)
end
