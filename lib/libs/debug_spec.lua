local debug = import("./debug")

describe("libs.debug", function()
	describe("restricted functions", function()
		it("getinfo is restricted", function()
			assert.equals(debug.getinfo, nil)
		end)

		it("getlocal is restricted", function()
			assert.equals(debug.getlocal, nil)
		end)

		it("setlocal is restricted", function()
			assert.equals(debug.setlocal, nil)
		end)

		it("getupvalue is restricted", function()
			assert.equals(debug.getupvalue, nil)
		end)

		it("setupvalue is restricted", function()
			assert.equals(debug.setupvalue, nil)
		end)

		it("sethook is restricted", function()
			assert.equals(debug.sethook, nil)
		end)
	end)
end)