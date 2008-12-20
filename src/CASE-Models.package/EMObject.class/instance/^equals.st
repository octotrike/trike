testing
= anObject
	"Answer whether I am equivalent to anObject."
	^self class = anObject class and: [uuid = anObject uuid]