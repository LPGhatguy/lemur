local Enum = import("./Enum")

describe("Enum", function()
    it("should have functioning Enums", function()
        assert.is_not_nil(Enum.NormalId)
        assert.is_not_nil(Enum.NormalId.Top)
    end)

    it("should give enums from GetEnums()", function()
        assert.is_true(#Enum:GetEnums() > 0)
    end)

    it("should give EnumItems from GetEnumItems()", function()
        -- If Roblox (probably zeuxcg) finds a 7th face on a cube, this won't work.
        assert.are.same(#Enum.NormalId:GetEnumItems(), 6)
    end)

    describe("EnumItem", function()
        it("should have valid properties", function()
            local item = Enum.NormalId.Top

            assert.are.same(item.Name, "Top")
            assert.is_true(type(item.Value) == "number")
            assert.are.same(item.EnumType, Enum.NormalId)
        end)
    end)
end)
