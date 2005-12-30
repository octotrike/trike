event handling
setUnknownActions
	"Answer an OrderedCollection containing one GenericAction to set all my unknown grid squares to each of the possible values."
	^self knownStates asOrderedCollection collect: [:state |
		self setUnknownToAction: state]