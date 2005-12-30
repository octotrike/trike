event handling
gridEditingActions
	"Answer an OrderedCollection containing all editing 
	operations my grid supports."
	| result |
	result := self setUnknownActions.
	result add: self resetAction.
	^result