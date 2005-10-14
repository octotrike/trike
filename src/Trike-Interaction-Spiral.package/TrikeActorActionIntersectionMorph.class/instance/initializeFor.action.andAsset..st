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
			[action ifNotNil: [action removeDependent: self].
			action := newAction.
			action ifNotNil: [action addDependent: self]].
	self update: #currentState