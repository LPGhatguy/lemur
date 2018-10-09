local json = import("./json")

describe("json", function()

	-- https://www.robloxdev.com/api-reference/function/HttpService/JSONDecode
	describe("decode", function()

		it("an empty JSON object generates an empty Lua table", function()

			assert.are.same({}, json.decode("{}"))

		end)

		it("if the input is not a valid JSON object, the function returns the string “Can’t parse JSON”", function()
		
			assert.are.same("Can\'t parse JSON", json.decode("foo"))
		end)

	end)

end)
