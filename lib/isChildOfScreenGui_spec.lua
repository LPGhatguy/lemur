local Frame = import("./instances/Frame")
local ScreenGui = import("./instances/ScreenGui")
local isChildOfScreenGui = import("./isChildOfScreenGui")

describe("isChildOfScreenGui", function()
	it("should be a function", function()
		assert.not_nil(isChildOfScreenGui)
		assert.equals(type(isChildOfScreenGui), "function")
	end)

	it("should return false when nil is passed in", function()
		assert.is_false(isChildOfScreenGui(nil))
	end)

	it("should return false when parent is nil", function()
		local frame = Frame:new()
		assert.is_false(isChildOfScreenGui(frame))
	end)

	it("should return false when no parent in the hierarchy is a ScreenGui", function()
		local parent = Frame:new()

		local child = Frame:new()
		child.Parent = parent

		local grandChild = Frame:new()
		grandChild.Parent = child

		assert.is_false(isChildOfScreenGui(grandChild))
	end)

	it("should return true when its parent is a ScreenGui", function()
		local parent = ScreenGui:new()

		local child = Frame:new()
		child.Parent = parent

		assert.is_true(isChildOfScreenGui(child))
	end)

	it("should return true when an ancestor is ScreenGui", function()
		local parent = ScreenGui:new()

		local child = Frame:new()
		child.Parent = parent

		local grandChild = Frame:new()
		grandChild.Parent = child

		assert.is_true(isChildOfScreenGui(grandChild))
	end)
end)