instance creation
on: aURI
	"Create a new instance of me on the given repository."
	
	^self on: aURI createIfNeeded: false
