accessing
removeAsset: asset
	"Remove asset from the Collection of assets stakeholders in this system care about."

	assets detect: [:a | a inScope not and: [a ~= asset]] ifNone: [^self].
	assets remove: asset.
	self 
		triggerEvent: asset class removeSymbol with: asset;
		triggerEvent: #intendedActions;
		triggerEvent: #attacks
	