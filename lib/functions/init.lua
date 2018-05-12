return function(habitat)
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

	functions["settings"] = import("./createSettings")(habitat)

	return functions
end