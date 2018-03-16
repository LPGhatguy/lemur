--[[
    WARNING: Exact GetEnumItems() is not in the same order as in Roblox.
    This shouldn't be an issue, but if it is...here's your warning.
]]

local Enum = {}
Enum.enums = {}

function Enum:GetEnums()
    return self.enums
end

for enumName, enumItems in pairs(import("./EnumList")) do
    local enumList = {}
    
    local enum = {
        GetEnumItems = function()
            return enumList
        end
    }

    for itemName, itemValue in pairs(enumItems) do
        local enumItem = {
            Name = itemName,
            Value = itemValue,
            EnumType = enum,
        }

        setmetatable(enumItem, {
            __tostring = string.format("Enum.%s.%s", enumName, itemName)
        })

        enum[itemName] = enumItem
        table.insert(enumList, enumItem)
    end

    setmetatable(enum, {
        __tostring = enumName
    })

    Enum[enumName] = enum
    table.insert(Enum.enums, enum)
end

return Enum
