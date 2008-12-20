instance creation
designated: nameString with: attributeTypeSet
	"Answer a new instance of me with the given designation and attributes."

	^(self designated: nameString)
		privateAttributes: attributeTypeSet;
		yourself