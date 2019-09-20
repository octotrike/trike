testing
= anObject 
	"Answer whether I am equivalent to anObject."

	^(self class = anObject class and: [self truthTable = anObject truthTable]) and: [self index = anObject index]