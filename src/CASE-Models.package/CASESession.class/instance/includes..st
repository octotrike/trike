accessing
includes: anObject

	^session ifNotNil:[
	session isPersistent: anObject] ifNil: [false].