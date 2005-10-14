initialization
initializeFor: aParameter action: aSymbol andAsset: anAsset 
	"Set my initial state."
	| newThreat |
	super
		initializeFor: aParameter
		action: aSymbol
		andAsset: anAsset.
	newThreat := (asset actionAt: actionSymbol) attacks
				detect: [:t | t class = parameter] ifNone: [nil].
	self threat: newThreat.
	self update: #currentState