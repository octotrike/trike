accessing
knownStates
	"Answer a Collection of states which are the known states for my grid squares."
	^self gridSquareClass states copyWithout: #unknown