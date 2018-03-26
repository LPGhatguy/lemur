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

	it("should error when parenting instances to invalid objects", function()
		local new = Instance.new("Folder")

		assert.has.errors(function()
			new.Parent = 7
		end)
	end)

	it("should error when setting unknown values", function()
		local new = Instance.new("Folder")

		assert.has.errors(function()
			new.frobulations = 6
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

	it("should allow the change and read of Name", function()
	   local instance = Instance.new("Folder")
	   assert.equal(instance.Name, "Folder")
	   instance.Name = "Foobar"
	   assert.equal(instance.Name, "Foobar")
	end)

	it("should not allow the change of ClassName", function()
	   local instance = Instance.new("Folder")
	   assert.equal(instance.ClassName, "Folder")
	   assert.has.errors(function()
	       instance.ClassName = "Foobar"
	   end)
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

		-- This may seem like a weird test, but it's for 100% coverage
		it("shouldn't react differently when setting the parent to the existing parent", function()
			local parent = Instance.new("Folder")
			local object = Instance.new("Folder", parent)

			assert.has_no_errors(function()
				object.Parent = parent
			end)
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

		it("should set the children's parents to nil", function()
			local parent = Instance.new("Folder")
			local child = Instance.new("Folder", parent)
			parent:Destroy()
			assert.equal(child.Parent, nil)
		end)

		it("should lock the parent property", function()
			local instance = Instance.new("Folder")
			local badParent = Instance.new("Folder")

			instance:Destroy()

			assert.has.errors(function()
				instance.Parent = badParent
			end)
		end)

		it("should only lock its own instance, and not all of the same type", function()
			local destroyFolder = Instance.new("Folder")
			destroyFolder:Destroy()
			assert.equal(destroyFolder.Parent, nil)

			local goodParent = Instance.new("Folder")
			local goodFolder = Instance.new("Folder")

			assert.has_no.errors(function()
				goodFolder.Parent = goodParent
			end)
		end)
	end)

	describe("IsA", function()
		it("should check classes directly", function()
			local instance = Instance.new("Folder")

			assert.equal(instance:IsA("Folder"), true)
		end)
	end)

	describe("GetFullName", function()
		it("should get the full name", function()
			local instance = Instance.new("Folder")
			instance.Name = "Test"
			local other = Instance.new("Folder")
			other.Name = "Parent"

			instance.Parent = other

			local fullName = instance:GetFullName()
			assert.equal("Parent.Test", fullName)
		end)

		it("should exclude game", function()
			local instance = Instance.new("Folder")
			instance.Name = "Test"
			local other = Instance.new("Game")
			other.Name = "Parent"

			instance.Parent = other

			local fullName = instance:GetFullName()
			assert.equal("Test", fullName)
		end)

		it("should return the instance name if there is no parent", function()
			local instance = Instance.new("Folder")
			instance.Name = "Test"

			local fullName = instance:GetFullName()
			assert.equal("Test", fullName)
		end)
	end)

	describe("tostring", function()
		it("should match the name of the instance", function()
			local instance = Instance.new("Folder")
			instance.Name = "foo"

			assert.equal(tostring(instance), "foo")
		end)
	end)

	describe("Changed", function()
		it("should fire Changed", function()
			local instance = Instance.new("Folder")

			local changedSpy = spy.new(function() end)
			instance.Changed:Connect(changedSpy)

			instance.Name = "NameChange"
			assert.spy(changedSpy).was.called_with("Name")
		end)
	end)

	describe("GetPropertyChangedSignal", function()
		it("should fire property signals for the right property", function()
			local instance = Instance.new("Folder")
			local spy = spy.new(function() end)
			instance:GetPropertyChangedSignal("Name"):Connect(spy)
			instance.Name = "NameChange"
			assert.spy(spy).was.called()
		end)

		it("should not fire property signals for the incorrect property", function()
			local instance = Instance.new("Folder")
			local spy = spy.new(function() end)
			instance:GetPropertyChangedSignal("Parent"):Connect(spy)
			instance.Name = "NameChange2"
			assert.spy(spy).was_not_called()
		end)

		it("should error when given an invalid property name", function()
			local instance = Instance.new("Folder")
			assert.has.errors(function()
				instance:GetPropertyChangedSignal("CanDestroyTheWorld"):Connect(function() end)
			end)
		end)
	end)

	describe("ClearAllChildren", function()
		it("should clear children", function()
			local parent = Instance.new("Folder")
			local child = Instance.new("Folder", parent)
			parent:ClearAllChildren()
			assert.equal(child.Parent, nil)
		end)
	end)

	describe("FindFirstAncestor", function()
		it("should find ancestors", function()
			local parent = Instance.new("Folder")
			parent.Name = "Ancestor"

			local child = Instance.new("Folder", parent)

			assert.equal(child:FindFirstAncestor("Ancestor"), parent)
		end)

		it("should return nil", function()
			local parent = Instance.new("Folder")
			local child = Instance.new("Folder", parent)
			assert.equal(child:FindFirstAncestor("Ancestor"), nil)
		end)
	end)

	describe("FindFirstAncestorOfClass", function()
		it("should find ancestors", function()
			local parent = Instance.new("Folder")
			local child = Instance.new("Folder", parent)

			assert.equal(child:FindFirstAncestorOfClass("Folder"), parent)
		end)

		it("should return nil", function()
			local parent = Instance.new("Frame")
			local child = Instance.new("Folder", parent)
			assert.equal(child:FindFirstAncestorOfClass("Folder"), nil)
		end)
	end)
end)