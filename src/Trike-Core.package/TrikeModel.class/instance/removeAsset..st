accessing
removeAsset: asset
	"Remove asset from the Collection of assets stakeholders in this system care about."

	assets remove: asset.
	self changed: #noAsset with: asset