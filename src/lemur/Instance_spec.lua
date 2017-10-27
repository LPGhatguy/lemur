local Instance = import("./Instance")

describe("Instance", function()
	it("should create instances of objects", function()
		local new = Instance.new("Folder")

		assert.not_nil(new)
	end)

	it("should error when given invalid instance names", function()
		assert.has.errors(function()
			Instance.new("ugh no")
		end)
	end)

	it("should error when indexing invalid instances", function()
		local instance = Instance.new("Folder")

		local function nop()
		end

		assert.has.errors(function()
			nop(instance.neverWillEXIST)
		end)
	end)

	describe("FindFirstChild", function()
		it("should never error on invalid index", function()
			local instance = Instance.new("Folder")

			assert.equal(instance:FindFirstChild("NEVER. WILL. EXIST!"), nil)
		end)
	end)
end)