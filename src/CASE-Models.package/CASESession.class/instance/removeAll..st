accessing
removeAll: aCollection
	"Stop persisting the given objects."
	
	^session commit: [session root removeAll: aCollection]