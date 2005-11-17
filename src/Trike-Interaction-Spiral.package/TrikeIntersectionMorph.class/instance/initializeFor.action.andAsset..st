initialization
initializeFor: aParameter action: aSymbol andAsset: anAsset 
	"Set my initial state."

	parameter := aParameter.
	actionSymbol := aSymbol.
	asset = anAsset 
		ifFalse: 
			[self unregisterForAssetEvents.
			asset := anAsset.
			self registerForAssetEvents].
	self triggerEvent: #currentState