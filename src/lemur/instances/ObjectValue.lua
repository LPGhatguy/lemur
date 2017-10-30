local ObjectValue = {
	properties = {}
}

function ObjectValue:init()
	self.Name = "Value"
end

ObjectValue.properties.Value = {
	get = function(self)
		return self._internal.value
	end,
	set = function(self, _, value)
		self._internal.value = value
	end,
}

return ObjectValue