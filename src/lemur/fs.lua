local ok, lfs = pcall(require, "lfs")

if not ok then
	error("Lemur requires LuaFileSystem, which couldn't be found: " .. lfs)
end

local fs = {}

function fs.isFile(path)
	return lfs.attributes(path, "mode") == "file"
end

function fs.isDirectory(path)
	return lfs.attributes(path, "mode") == "directory"
end

return fs