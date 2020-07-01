--[[
	Serves as just a source container right now.
]]

local BaseInstance = import("./BaseInstance")
local InstanceProperty = import("../InstanceProperty")

local Script = BaseInstance:extend("Script", {
	creatable = true,
})

function Script:init(instance)
	local internal = getmetatable(instance).instance

	internal.hasRun = false

	instance.AncestryChanged:Connect(function()
		if internal.hasRun then
			return
		end

		local game = instance:FindFirstAncestorOfClass("DataModel")

		if game == nil then
			return
		end

		internal.hasRun = true

		-- TODO: Correctly handle errors

		local co = coroutine.create(loadstring(instance.Source))
		getmetatable(game).instance.habitat.taskScheduler:schedule(0, co)
	end)
end

Script.properties.Source = InstanceProperty.normal({
	getDefault = function()
		return ""
	end,
})

return Script