accessing
action: aSymbol 
	"Set the symbol representing the kind of this action. aSymbol 
	should be one of asset possibleActions; if this is not the case, 
	or asset has not been set, raise an exception."
	self
		assert: [asset notNil
				and: [asset possibleActions includes: aSymbol]].
	action := aSymbol