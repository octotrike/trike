accessing
addAll: aCollection
	"Persist the given objects and all of the objects they point to."
	
	^session commit: [session root addAll: aCollection]