accessing
asset: anAsset 
	"Set the TrikeAsset this action is performed on to anAsset."
	asset = anAsset
		ifTrue: [^ self].
	self unregisterForAssetEvents; disconnectAttacksFromAsset.
	asset := anAsset.
	self registerForAssetEvents; connectAttacksToAsset; modelChanged; triggerEvent: #asset