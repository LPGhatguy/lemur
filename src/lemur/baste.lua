-- luacheck: ignore

--[[
	Baste, a module system for Lua
	Version 1.2.0-dev

	MIT License

	Copyright (c) 2017 Lucien Greathouse

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in all
	copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
	SOFTWARE.
]]

local baste = {}

local path = {}
baste._path = path

--[[
	Normalize the given path by removing unnecessary slashes, `.`, and `..`.
]]
function path.normalize(input)
	return (input
		-- Normalize \ and / to /
		:gsub("[/\\]+", "/")
		-- Remove trailing slashes
		:gsub("/+$", "")
		-- Handle .
		:gsub("^%./", "")
		:gsub("/%.$", "/")
		:gsub("/%./", "/")
		-- Handle ..
		:gsub("[^/]+/%.%./", ""))
end

--[[
	Returns everything except the last node in the path. This will be the folder
	containing the input path.

	When used in combination with path.leaf and path.join, it's possible to
	reconstruct a path with the same semantic meaning as the original input:

	`input` vs `path.join(path.withoutLeaf(input), path.leaf(input))`
]]
function path.withoutLeaf(input)
	input = path.normalize(input)

	return (input:match("^(.+)/[^/]+$")) or "."
end

--[[
	Get the file extension of the given path, or nil if there isn't one.
]]
function path.extension(input)
	return (input:match("%.([^./]-)$"))
end

--[[
	Joins together the given list of path fragments.

	Only the first path fragment is allowed to be an absolute path, but this
	isn't verified.
]]
function path.join(...)
	return path.normalize(table.concat({...}, "/"))
end

-- Abstraction over loadstring and load
local loadWithEnv
if setfenv then
	-- 5.1, LuaJIT
	loadWithEnv = function(source, name, env)
		local chunk, err = loadstring(source, name)

		if not chunk then
			return nil, err
		end

		if env then
			setfenv(chunk, env)
		end

		return chunk
	end
else
	-- 5.2+
	loadWithEnv = function(source, name, env)
		return load(source, name, "bt", env)
	end
end

-- Abstraction over filesystem APIs
local function readFile(path)
	local handle, err = io.open(path, "r")

	if not handle then
		return nil, err
	end

	local contents = handle:read("*all")
	handle:close()

	return contents
end

if love then
	local oldReadFile = readFile

	readFile = function(path)
		local contents = love.filesystem.read(path)

		-- It could still exist outside the sandbox!
		if not contents then
			return oldReadFile(path)
		end

		return contents
	end
end

local loadedModules = {}
local moduleResults = {}

--[[
	Because of tail-call optimization, trying to get the file location of a
	chunk whose contents are just a return statement fails.

	Using an 'import function factory' solves thie problem by injecting the
	file's path into the generated function. This also reduces the number of
	debug library calls.
]]
local function makeImport(root)
	return function(modulePath)
		local current = root or debug.getinfo(2, "S").source:gsub("^@", "")

		if type(modulePath) ~= "string" then
			local message = "Bad argument #1 to import, expected string but got %s"
			error(string.format(message, type(modulePath)), 2)
		end

		-- Relative import!
		if modulePath:sub(1, 1) == "." then
			local currentDirectory = path.withoutLeaf(current)
			local relativeModulePath = path.join(currentDirectory, modulePath)

			local pathsToTry = {relativeModulePath}

			if not path.extension(modulePath) then
				table.insert(pathsToTry, relativeModulePath .. ".lua")
				table.insert(pathsToTry, path.join(relativeModulePath, "init.lua"))
			end

			-- TODO: Plug-in point for adding additional paths to try

			-- Have we loaded this module before?
			for _, target in ipairs(pathsToTry) do
				if loadedModules[target] then
					return moduleResults[target]
				end
			end

			-- Let's try to load from these paths!
			for _, target in ipairs(pathsToTry) do
				-- Hand-craft an environment for the module we're loading
				-- The module won't be able to iterate over globals!
				local env = setmetatable({
					import = makeImport(target),
				}, {
					__index = _G,
					__newindex = _G,
				})

				-- TODO: Plug-in point for adding extra loaders

				local source = readFile(target)

				if source then
					local chunk, err = loadWithEnv(source, "@" .. target, env)

					if chunk then
						local result = chunk()
						loadedModules[target] = true
						moduleResults[target] = result

						return result
					else
						-- Syntax error!
						error(err, 2)
					end
				end
			end

			-- We didn't find any modules.
			local message = string.format("Couldn't import %q from file %s, tried:\n\t%s",
				modulePath,
				current,
				table.concat(pathsToTry, "\n\t")
			)

			error(message, 2)
		else
			-- TODO: check `baste_modules` folder (or similar)
			return require(modulePath)
		end
	end
end

baste.import = makeImport()

function baste.global()
	_G.import = baste.import

	return baste
end

return baste