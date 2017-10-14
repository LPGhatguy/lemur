local Lemur = {}

function Lemur:init()
	assert(self.Parent, "Lemur needs a Parent!")
	assert(self.Parent.ClassName == "DataModel", "Lemur's Parent must be a DataModel!")

	self.habitat = self.Parent._habitat
end

return Lemur