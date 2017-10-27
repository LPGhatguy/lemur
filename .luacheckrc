stds.baste = {
	read_globals = {
		"import",
	},
}

ignore = {
	"212", -- unused arguments
	"421", -- shadowing local variable
	"422", -- shadowing argument
	"431", -- shadowing upvalue
	"432", -- shadowing upvalue argument
}

std = "lua51+baste"

files["src/**/*_spec.lua"] = {
	std = "+busted",
}

files["spec/**/*.lua"] = {
	std = "+busted",
}