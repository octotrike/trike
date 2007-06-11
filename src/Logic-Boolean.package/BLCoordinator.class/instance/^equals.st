testing
= anObject 
	"Answer whether I am equivalent to anObject."
	^self class = anObject class 
		and: [self children size = (self children union: anObject children) size]
