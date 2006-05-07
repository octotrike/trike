instance creation
designated: nameString on: entityModel
	"Answer a new instance of me, based on entityModel, with nameString as a designation."
	
	^(self new)
		designated: nameString;
		model: entityModel;
		yourself