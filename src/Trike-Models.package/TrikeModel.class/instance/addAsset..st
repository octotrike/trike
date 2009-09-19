accessing
addAsset: asset 
	"Add asset to the Collection of assets stakeholders in this system care about."

	assets add: asset.
	self triggerEvent: asset class addSymbol with: asset.
	^asset