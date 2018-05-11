return function(flags)
	local names = {
		"typeof",
		"warn",
		"tick",
		"wait",
		"spawn",
	}

	local functions = {}

	for _, name in ipairs(names) do
		functions[name] = import("./" .. name)
	end

	functions["settings"] = import("./settings")(flags)

	return functions
end