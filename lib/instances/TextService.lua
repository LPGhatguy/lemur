local BaseInstance = import("./BaseInstance")
local TextService = BaseInstance:extend("TextService")
local Vector2 = import("../types/Vector2")

function TextService.prototype:GetTextSize(text, fontSize, font, frameSize)
    if not text then
        return Vector2.new()
    end

    return Vector2.new(
        string.len(text) * fontSize,
        fontSize
    )
end

return TextService