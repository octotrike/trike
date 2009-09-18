accessing
includes: anObject

	^session 
		ifNil: [false] 
		ifNotNil: [session isPersistent: anObject]