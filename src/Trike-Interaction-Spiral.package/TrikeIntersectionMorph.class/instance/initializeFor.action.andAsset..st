initialization
initializeFor: aParameter action: aSymbol andAsset: anAsset 
	"Set my initial state."

	parameter := aParameter.
	actionSymbol := aSymbol.
	asset = anAsset 
		ifFalse: 
			[asset ifNotNil: [asset removeDependent: self].
			asset := anAsset.
			asset addDependent: self].
	self update: #currentState