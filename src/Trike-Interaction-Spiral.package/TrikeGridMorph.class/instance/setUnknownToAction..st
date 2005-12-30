event handling
setUnknownToAction: anObject
	"Answer a GenericAction which will set all #unknown grid squares to anObject."
	| result |
	result := GenericAction
		label: 'unknown -> ', anObject asString
		receiver: model
		selector: self setUnknownToSelector
		arguments: {anObject}.
	result description: 'Set the value of all unknown squares to ', anObject asString.
	^result