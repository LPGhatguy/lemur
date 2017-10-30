local Instance = import("./Instance")
local typeof = import("./functions/typeof")

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

	it("should be identified by typeof", function()
		local instance = Instance.new("Folder")

		assert.equal(typeof(instance), "Instance")
	end)

	describe("Parent", function()
		it("should be set to nil by default", function()
			local instance = Instance.new("Folder")

			assert.equal(instance.Parent, nil)
		end)

		it("should be set to the given value if available", function()
			local parent = Instance.new("Folder")

			local child = Instance.new("Folder", parent)
			child.Name = "foo"

			assert.equal(child.Parent, parent)
			assert.equal(parent:FindFirstChild("foo"), child)
		end)

		it("should set to nil", function()
			local parent = Instance.new("Folder")

			local child = Instance.new("Folder", parent)
			child.Name = "foo"

			assert.equal(parent:FindFirstChild("foo"), child)

			child.Parent = nil

			assert.equal(parent:FindFirstChild("foo"), nil)
		end)

		it("should set to other instances", function()
			local parent1 = Instance.new("Folder")
			local parent2 = Instance.new("Folder")

			local child = Instance.new("Folder", parent1)
			child.Name = "foo"

			assert.equal(parent1:FindFirstChild("foo"), child)

			child.Parent = parent2

			assert.equal(parent1:FindFirstChild("foo"), nil)
			assert.equal(child.Parent, parent2)
			assert.equal(parent2:FindFirstChild("foo"), child)
		end)
	end)

	describe("FindFirstChild", function()
		it("should never error on invalid index", function()
			local instance = Instance.new("Folder")

			assert.equal(instance:FindFirstChild("NEVER. WILL. EXIST!"), nil)
		end)
	end)

	describe("GetChildren", function()
		it("should return no children for empty instances", function()
			local instance = Instance.new("Folder")

			assert.equal(#instance:GetChildren(), 0)
		end)

		it("should yield all children", function()
			local parent = Instance.new("Folder")
			local child1 = Instance.new("Folder", parent)
			local child2 = Instance.new("Folder", parent)

			assert.equal(#parent:GetChildren(), 2)

			local child1Seen = false
			local child2Seen = false
			for _, child in ipairs(parent:GetChildren()) do
				if child == child1 then
					child1Seen = true
				elseif child == child2 then
					child2Seen = true
				else
					error("Invalid child found")
				end
			end

			assert.equal(child1Seen, true)
			assert.equal(child2Seen, true)
		end)
	end)

	describe("Destroy", function()
		it("should set the instance's Parent to nil", function()
			local parent = Instance.new("Folder")
			local child = Instance.new("Folder", parent)

			assert.equal(child.Parent, parent)

			child:Destroy()

			assert.equal(child.Parent, nil)
		end)
	end)

	describe("IsA", function()
		it("should check classes directly", function()
			local instance = Instance.new("Folder")

			assert.equal(instance:IsA("Folder"), true)
		end)
	end)

	describe("tostring", function()
		it("should match the name of the instance", function()
			local instance = Instance.new("Folder")
			instance.Name = "foo"

			assert.equal(tostring(instance), "foo")
		end)
	end)
end)