local Habitat = require("lemur.Habitat")

return {
	Habitat = Habitat,
}

-- local env = {}

-- for key, value in pairs(_G) do
-- 	env[key] = value
-- end

-- local function toPieces(path)
-- 	path = path:gsub("%.lua$", "")
-- 	local pieces = {}

-- 	for piece in path:gmatch("[^/]+") do
-- 		table.insert(pieces, piece)
-- 	end

-- 	return pieces
-- end

-- local function getScript(pieces)
-- 	local script = {
-- 		ClassName = "ModuleScript",
-- 		pieces = pieces,
-- 	}

-- 	setmetatable(script, {
-- 		__index = function(self, key)
-- 			if key == "Parent" then
-- 				local newPieces = {}

-- 				for i = 1, #pieces - 1 do
-- 					newPieces[i] = pieces[i]
-- 				end

-- 				return getScript(newPieces)
-- 			else
-- 				local newPieces = {}

-- 				for i = 1, #pieces do
-- 					newPieces[i] = pieces[i]
-- 				end

-- 				newPieces[#pieces + 1] = key

-- 				return getScript(newPieces)
-- 			end
-- 		end
-- 	})

-- 	return script
-- end

-- local function loadx(path)
-- 	local chunk, err = loadfile(path)

-- 	assert(chunk, err)

-- 	local newEnv = {}

-- 	for key, value in pairs(env) do
-- 		newEnv[key] = value
-- 	end

-- 	local pieces = toPieces(path)
-- 	newEnv.script = getScript(pieces)

-- 	setfenv(chunk, newEnv)

-- 	return chunk()
-- end

-- env.require = function(path)
-- 	if type(path) == "table" then
-- 		local fpath = table.concat(path.pieces, "/") .. ".lua"

-- 		return loadx(fpath)
-- 	else
-- 		return require(path)
-- 	end
-- end