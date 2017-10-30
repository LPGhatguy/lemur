--[[
	Has extra properties:
	* _path: The path to the script on the filesystem
	* _habitat: The habitat this script was created in
	* _loaded: Whether this script has been loaded
	* _result: The result of the previous require
]]

local ModuleScript = {}

function ModuleScript:init()
	self.Source = ""
end

return ModuleScript