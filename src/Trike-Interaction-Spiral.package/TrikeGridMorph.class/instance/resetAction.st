event handling
resetAction
	"Answer a GenericAction which will reset all grid squares to #unknown."
	| result |
	result :=  GenericAction
		label: 'reset'
		receiver: model
		selector: self resetSelector.
	result description: 'Reset the value of all grid squares to unknown'.
	^result