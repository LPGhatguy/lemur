local BaseInstance = import("./BaseInstance")
local CollectionService = BaseInstance:extend("CollectionService")
local Signal = import("../Signal")
local validateType = import("../validateType")

local tags = {}
local addedSignals = {}
local removedSignals = {}

function CollectionService.prototype:AddTag(instance, tag)
	validateType("instance", instance, "Instance")
	validateType("tag", tag, "string")

	local instanceTags = tags[instance]
	if not instanceTags then
		instanceTags = {}
		tags[instance] = instanceTags
	end

	if instanceTags[tag] == nil and addedSignals[tag] ~= nil and instance:FindFirstAncestorOfClass("DataModel") then
		addedSignals[tag]:Fire(instance)
	end

	instanceTags[tag] = true
end

function CollectionService.prototype:GetInstanceAddedSignal(tag)
	validateType("tag", tag, "string")

	if not addedSignals[tag] then
		addedSignals[tag] = Signal.new()
	end

	return addedSignals[tag]
end

function CollectionService.prototype:GetInstanceRemovedSignal(tag)
	validateType("tag", tag, "string")

	if not removedSignals[tag] then
		removedSignals[tag] = Signal.new()
	end

	return removedSignals[tag]
end

function CollectionService.prototype:GetTagged(tag)
	validateType("tag", tag, "string")

	local tagged = {}

	for instance, tags in pairs(tags) do
		if tags[tag] and instance:FindFirstAncestorOfClass("DataModel") then
			table.insert(tagged, instance)
		end
	end

	return tagged
end

function CollectionService.prototype:GetTags(instance)
	validateType("instance", instance, "Instance")

	local instanceTags = tags[instance]
	if not instanceTags then
		return {}
	end

	local tagsOfInstance = {}
	for tag in pairs(instanceTags) do
		table.insert(tagsOfInstance, tag)
	end
	return tagsOfInstance
end

function CollectionService.prototype:HasTag(instance, tag)
	validateType("instance", instance, "Instance")
	validateType("tag", tag, "string")

	local instanceTags = tags[instance]
	if not instanceTags then
		return false
	end

	if instanceTags[tag] == nil then
		return false
	end

	return true
end

function CollectionService.prototype:RemoveTag(instance, tag)
	validateType("instance", instance, "Instance")
	validateType("tag", tag, "string")

	local instanceTags = tags[instance]
	if not instanceTags then
		return
	end

	if instanceTags[tags] == nil and removedSignals[tag] ~= nil and instance:FindFirstAncestorOfClass("DataModel") then
		removedSignals[tag]:Fire(instance)
	end

	instanceTags[tag] = nil
end

return CollectionService