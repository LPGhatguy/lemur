local Signal = import("./Signal")

describe("Signal", function()
	it("should be instantiable", function()
		local signal = Signal.new()

		assert.not_nil(signal)
	end)

	it("should handle connections", function()
		local signal = Signal.new()
		local callCount = 0

		local connection = signal:Connect(function()
			callCount = callCount + 1
		end)

		assert.not_nil(connection)
		assert.equal(callCount, 0)

		signal:Fire()
		assert.equal(callCount, 1)

		signal:Fire()
		assert.equal(callCount, 2)

		connection:Disconnect()
		signal:Fire()
		assert.equal(callCount, 2)
	end)

	it("should preserve other connections on disconnect", function()
		local signal = Signal.new()
		local countA = 0
		local countB = 0

		local connectionA = signal:Connect(function()
			countA = countA + 1
		end)

		signal:Connect(function()
			countB = countB + 1
		end)

		assert.equal(countA, 0)
		assert.equal(countB, 0)

		signal:Fire()

		assert.equal(countA, 1)
		assert.equal(countB, 1)

		connectionA:Disconnect()
		signal:Fire()

		assert.equal(countA, 1)
		assert.equal(countB, 2)
	end)

	it("should force-fire on Wait()", function()
		local signal = Signal.new()
		local callCount = 0

		signal:Connect(function()
			callCount = callCount + 1
		end)

		assert.equal(callCount, 0)

		signal:Wait()

		assert.equal(callCount, 1)
	end)
end)