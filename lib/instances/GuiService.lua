local BaseInstance = import("./BaseInstance")
local GuiService = BaseInstance:extend("GuiService")

local function validateType(name, value, expectedTypeAsString)
	local actualType = type(value)
	if actualType ~= expectedTypeAsString then
		error(string.format("%s must be type `%s`, got type `%s`", name, expectedTypeAsString, actualType), 3)
	end
end

function GuiService.prototype.BroadcastNotification(data, notification)
	validateType("data", data, "string")
	validateType("noficiation", notification, "number")
end

function GuiService.prototype.GetNotificationTypeList()
	return {
		VIEW_SUB_PAGE_IN_MORE = "VIEW_SUB_PAGE_IN_MORE",
		ACTION_LOG_OUT = "ACTION_LOG_OUT",
	}
end

function GuiService.prototype.SetGlobalGuiInset(x1, y1, x2, y2)
	validateType("x1", x1, "number")
	validateType("y1", y1, "number")
	validateType("x2", x2, "number")
	validateType("y2", y2, "number")
end

function GuiService.prototype.SafeZoneOffsetsChanged()
end

return GuiService