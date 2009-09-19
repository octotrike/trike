event handling
testNoAssetTrigger
	"Removing an asset should trigger #noAsset:."
	model
		when: #noAsset:
		send: #receiveEvent:
		to: self.
	model removeAsset: cleartext.
	self
		should: [receivedEvents includes: cleartext];
		should: [receivedEvents size = 1]