initialization
initializeFor: aParameter action: aSymbol andAsset: anAsset 
	"Set my initial state."

	| newAction |
	super 
		initializeFor: aParameter
		action: aSymbol
		andAsset: anAsset.
	newAction := asset actionAt: actionSymbol.
	action = newAction 
		ifFalse: 
			[action ifNotNil: [action removeActionsWithReceiver: self forEvent: #rule].
			action := newAction.
			action ifNotNil: [action when: #rule send: #updateState to: self]].
	self update: #currentState