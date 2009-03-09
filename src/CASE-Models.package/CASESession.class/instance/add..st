accessing
add: anObject
	"Persist the given object and all of the objects it points to."
	
	^session commit: [session root add: anObject]