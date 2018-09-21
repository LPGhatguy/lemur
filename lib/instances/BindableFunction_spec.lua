local Instance = import("../Instance")

describe("instances.BindableFunction", function()
	it("should instantiate", function()
		local instance = Instance.new("BindableFunction")

		assert.not_nil(instance)
	end)

	it("should have the name Function", function()
		local instance = Instance.new("BindableFunction")

		assert.equals(instance.Name, "Function")
	end)

	it("should error when trying to read", function()
		local instance = Instance.new("BindableFunction")

		assert.has.errors(function()
			local _ = instance.OnInvoke
		end)
	end)

	it("should be able to write to OnInvoke", function()
		local instance = Instance.new("BindableFunction")

		assert.has_no.errors(function()
			instance.OnInvoke = function() end
		end)
	end)

	it("should fire OnInvoke when invoked", function()
		local instance = Instance.new("BindableFunction")

		local testSpy = spy.new(function() end)
		instance.OnInvoke = testSpy
		instance:Invoke()

		assert.spy(testSpy).was_called(1)
	end)

	it("should not error when OnInvoke is nil", function()
		local instance = Instance.new("BindableFunction")

		assert.has_no.errors(function()
			instance:Invoke()
		end)
	end)

	-- Undocumented table shenanigans
	it("should send a table fine if it's only numeric", function()
		local instance = Instance.new("BindableFunction")
		local spy = spy.new(function() end)

		instance.OnInvoke = spy
		instance:Invoke({ "a", "b", "c" })
		assert.spy(spy).was.called_with({ "a", "b", "c" })
	end)

	it("should send a table fine if it's only a dictionary", function()
		local instance = Instance.new("BindableFunction")
		local spy = spy.new(function() end)

		instance.OnInvoke = spy
		instance:Invoke({ foo = 1, bar = 2 })
		assert.spy(spy).was.called_with({ foo = 1, bar = 2 })
	end)

	it("should only send the numeric portion of a mixed table", function()
		local instance = Instance.new("BindableFunction")
		local spy = spy.new(function() end)

		instance.OnInvoke = spy
		instance:Invoke({ "oh", "no", undocumented = "behavior" })
		assert.spy(spy).was.called_with({ "oh", "no" })
	end)
end)