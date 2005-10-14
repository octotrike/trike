instance creation
for: aParameter action: actionSymbol andAsset: anAsset 
	"Answer a new instance of myself, initialized with the 
	appropriate values."
	^ self new
		initializeFor: aParameter
		action: actionSymbol
		andAsset: anAsset