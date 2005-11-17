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
			[self unregisterForActionEvents.
			action := newAction.
			self registerForActionEvents].
	self currentStateChanged