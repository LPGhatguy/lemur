local BaseInstance = import("./BaseInstance")
local validateType = import("../validateType")
local ContextActionService = BaseInstance:extend("ContextActionService")

function ContextActionService.prototype:BindCoreAction(actionName, functionToBind, createTouchButton, ...)
	validateType("actionName", actionName, "string")
	validateType("functionToBind", functionToBind, "function")
	validateType("createTouchButton", createTouchButton, "boolean")
end

function ContextActionService.prototype:UnbindCoreAction(actionName)
	validateType("actionName", actionName, "string")
end

return ContextActionService