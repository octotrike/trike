instance creation
on: aURI createIfNeeded: aBoolean
	"Create a new instance of me on the given repository, creating the directory if needed and aBoolean is true."
	| newBlock |
	
	newBlock := [super new on: aURI].
	^aBoolean
		ifFalse: newBlock
		ifTrue: [newBlock on: MagmaEnvironmentError do: [:ex | 
			MagmaRepositoryController create: aURI root: nil.
			super new on: aURI]]