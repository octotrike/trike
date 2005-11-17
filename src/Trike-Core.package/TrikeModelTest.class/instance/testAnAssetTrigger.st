event handling
testAnAssetTrigger
	"Adding an asset should trigger #anAsset:."
	| timestamp |
	model
		when: #anAsset:
		send: #receiveEvent:
		to: self.
	timestamp := TrikeAsset named: 'Timestamp' in: model.
	self
		should: [receivedEvents includes: timestamp];
		should: [receivedEvents size = 1]