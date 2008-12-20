instance creation
designated: nameString with: dataObjectSet
	"Answer a new instance of me with the given designation and components."

	^(self designated: nameString)
		components: dataObjectSet;
		yourself