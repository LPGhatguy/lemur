local HttpService = import("./HttpService")

describe("instances.HttpService", function()
	it("should instantiate", function()
		local instance = HttpService:new()

		assert.not_nil(instance)
	end)

	it("should json encode properly", function()
		local instance = HttpService:new()

		assert.equal(instance:JSONEncode({ 1, true }), "[1,true]")
	end)

	it("should json decode properly", function()
		local instance = HttpService:new()

		assert.are.same(instance:JSONDecode("[1,true]"), { 1, true })
	end)
end)