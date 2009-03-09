accessing
remove: anObject
	"Stop persisting the given object."
	
	^session commit: [session root remove: anObject]