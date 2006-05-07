instance creation
designated: nameString
	"Answer a new instance of me with the given designation."

	^(self new)
		designated: nameString;
		yourself