accessing
addAsset: asset 
	"Add asset to the Collection of assets stakeholders in this system care about."

	assets add: asset.
	self changed: #anAsset with: asset.
	^asset