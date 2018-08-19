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

	it("should send HTTP requests", function()
		local httpImpl = {
			request = function()
				return 1, 200, {}
			end,
			tableSink = function()
				return {}
			end,
		}

		local instance = HttpService:new(httpImpl)

		local response = instance:RequestAsync({
			Url = "https://google.com/",
		})

		print(response.Body)
	end)
end)