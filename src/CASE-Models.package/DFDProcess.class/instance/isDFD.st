testing
isDFD
	"Answer whether I am a data flow diagram (vs. just a component of one)."

	^self isTop or: [self notEmpty]
