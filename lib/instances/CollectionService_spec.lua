local CollectionService = import("./CollectionService")
local Folder = import("./Folder")
local Game = import("./Game")

describe("instances.CollectionService", function()
	it("should instantiate", function()
		local instance = CollectionService:new()

		assert.not_nil(instance)
	end)

	it("should add tags to instances", function()
		local instance = CollectionService:new()
		local folder = Folder:new()

		instance:AddTag(folder, "Tag")
	end)

	describe("GetTagged", function()
		it("should get instances in the data model", function()
			local instance = CollectionService:new()

			local inDataModel = Folder:new()
			inDataModel.Parent = Game:new()
			instance:AddTag(inDataModel, "Tag")

			local notInDataModel = Folder:new()
			instance:AddTag(notInDataModel, "Tag")

			assert.same(instance:GetTagged("Tag"), { inDataModel })
		end)
	end)

	describe("GetTags", function()
		it("should get tags", function()
			local instance = CollectionService:new()
			local folder = Folder:new()

			instance:AddTag(folder, "Tag")
			assert.same(instance:GetTags(folder), { "Tag" })
		end)

		it("should return an empty table if there are no tags", function()
			local instance = CollectionService:new()
			local folder = Folder:new()

			assert.same(instance:GetTags(folder), {})
		end)
	end)

	describe("GetInstanceAddedSignal", function()
		it("should fire a signal when a tag is given to an instance in the datamodel", function()
			local instance = CollectionService:new()
			local folder = Folder:new()
			folder.Parent = Game:new()

			local spy = spy.new(function() end)
			instance:GetInstanceAddedSignal("Tag"):Connect(spy)
			instance:AddTag(folder, "Tag")
			assert.spy(spy).was_called_with(folder)
		end)

		it("should not fire the signal when a tag is given but its outside the datamodel", function()
			local instance = CollectionService:new()
			local folder = Folder:new()

			local spy = spy.new(function() end)
			instance:GetInstanceAddedSignal("Tag"):Connect(spy)
			instance:AddTag(folder, "Tag")
			assert.spy(spy).was_not_called()
		end)

		it("should not fire the signal if the instance already has the tag", function()
			local instance = CollectionService:new()
			local folder = Folder:new()
			folder.Parent = Game:new()

			local spy = spy.new(function() end)
			instance:GetInstanceAddedSignal("Tag"):Connect(spy)
			instance:AddTag(folder, "Tag")
			instance:AddTag(folder, "Tag")
			assert.spy(spy).was.called(1)
		end)
	end)

	describe("GetInstanceRemovedSignal", function()
		it("should fire a signal when a tag is removed from an instance in the datamodel", function()
			local instance = CollectionService:new()
			local folder = Folder:new()
			folder.Parent = Game:new()

			local spy = spy.new(function() end)
			instance:GetInstanceRemovedSignal("Tag"):Connect(spy)
			instance:AddTag(folder, "Tag")
			instance:RemoveTag(folder, "Tag")
			assert.spy(spy).was_called_with(folder)
		end)
	end)

	describe("HasTag", function()
		it("should check if the instance has a tag", function()
			local instance = CollectionService:new()
			local folder = Folder:new()

			instance:AddTag(folder, "Tag")
			assert.True(instance:HasTag(folder, "Tag"))
			assert.False(instance:HasTag(folder, "Doge"))
		end)

		it("should always return false if there are no tags", function()
			local instance = CollectionService:new()
			local folder = Folder:new()

			assert.False(instance:HasTag(folder, "Tag"))
		end)
	end)

	describe("RemoveTag", function()
		it("should remove tags", function()
			local instance = CollectionService:new()
			local folder = Folder:new()

			instance:AddTag(folder, "Tag")
			instance:RemoveTag(folder, "Tag")
			assert.False(instance:HasTag(folder, "Tag"))
		end)

		it("should not error if there are no tags", function()
			local instance = CollectionService:new()
			local folder = Folder:new()

			instance:RemoveTag(folder, "Tag")
		end)
	end)
end)