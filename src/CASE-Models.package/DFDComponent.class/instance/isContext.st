testing
isContext
	"Answer whether I am a context DFD."

	^self isDFD and: [self isTop]


	