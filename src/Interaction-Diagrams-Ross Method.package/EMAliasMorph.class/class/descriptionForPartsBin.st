parts bin
descriptionForPartsBin
	"Answer a description for the parts bin."
	
	^ self partName:		self modelClass designation
		categories:		self partsBinCategories
		documentation:	self modelClass description