local TestService = {}

function TestService:Error(message)
	io.stderr:write(message)
	io.stderr:write("\n")
end

return TestService