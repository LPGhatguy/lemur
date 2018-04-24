local Instance = import("../Instance")

describe("instances.HttpService", function()
	it("should instantiate", function()
		local instance = Instance.new("IntValue")

		assert.not_nil(instance)
		assert.equal("Value", instance.Name)
		assert.equal(0, instance.Value)
	end)

	it("should json encode properly", function()
		local instance = Instance.new("HttpService")

		assert.equal(instance:JSONEncode({ 1, true }), "[1,true]")
	end)

	it("should json decode properly", function()
		local instance = Instance.new("HttpService")

		assert.are.same(instance:JSONDecode("[1,true]"), { 1, true })
	end)
end)