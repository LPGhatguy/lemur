local Instance = import("../Instance")
local Enum = import("../Enum")
local Vector2 = import("../types/Vector2")
local typeof = import("../functions/typeof")

describe("instances.TextService", function()
	it("should instantiate", function()
		local instance = Instance.new("TextService")

		assert.not_nil(instance)
	end)

	describe("GetTextSize", function()
		it("should verify parameters", function()
			local instance = Instance.new("TextService")

			assert.has.errors(function()
				instance:GetTextSize(100, 36, Enum.Font.Legacy, Vector2.new(1, 1))
			end)
			assert.has.errors(function()
				instance:GetTextSize("text", "str", Enum.Font.Legacy, Vector2.new(1, 1))
			end)
			assert.has.errors(function()
				instance:GetTextSize("text", 36, "hey", Vector2.new(1, 1))
			end)
			assert.has.errors(function()
				instance:GetTextSize("text", 36, Enum.Font.Legacy, 100)
			end)
		end)

		it("should return a Vector2", function()
			local instance = Instance.new("TextService")
			local result = instance:GetTextSize("text", 36, Enum.Font.Legacy, Vector2.new(1000, 1000))

			assert.equals(typeof(result), "Vector2")
		end)

		it("should clip the rect down", function()
			local instance = Instance.new("TextService")
			local result = instance:GetTextSize("VERY LARGE TEXT", 36, Enum.Font.Legacy, Vector2.new(1, 1))

			assert.same({result.X, result.Y}, {1, 1})
		end)
	end)

	--[[
local BaseInstance = import("./BaseInstance")
local Vector2 = import("../types/Vector2")
local typeof = import("../functions/typeof")
local TextService = BaseInstance:extend("TextService")

-- right now this is just a lazy [fontSize * len(text), fontSize] clipped by frameSize
function TextService.prototype:GetTextSize(text, fontSize, font, frameSize)
    if typeof(text) ~= "string" then
        error("text must a string", 2)
    elseif typeof(fontSize) ~= "number" then
        error("fontSize must a number", 2)
    elseif typeof(font) ~= "number" then
        error("font must an Enum.Font", 2)
    elseif typeof(frameSize) ~= "Vector2" then
        error("frameSize must be a Vector2", 2)
    end

    local width = string.len(text)

    return Vector2.new(math.min(width, frameSize.X), math.min(fontSize, frameSize.Y))
end

return TextService		
	]]
end)