testing
= anObject
	"Answer whether I am equivalent to anObject."

	^(self species == anObject species) and: [self label = anObject label].