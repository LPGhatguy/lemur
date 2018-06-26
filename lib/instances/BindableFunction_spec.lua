local Instance = import("../Instance")

describe("instances.BindableFunction", function()
	it("should instantiate", function()
		local instance = Instance.new("BindableFunction")

		assert.not_nil(instance)
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

	it("should error when OnInvoke is not a function when called", function()
		local instance = Instance.new("BindableFunction")

		assert.has_no.errors(function()
			instance.OnInvoke = 3
		end)

		assert.has.errors(function()
			instance:Invoke()
		end)
	end)
end)