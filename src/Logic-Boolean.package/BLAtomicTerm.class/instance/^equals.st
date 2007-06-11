testing
= anObject
	"Answer whether I am equivalent to anObject."

	^self class = anObject class 
		and: [self atom = anObject atom]
		and: [self isNegated = anObject isNegated]