event handling
testAttacksTrigger
	"Adding a threat should trigger #attacks. The easiest way to  
	add a threat is to add an asset."
	model
		when: #attacks
		send: #receiveEvent:
		to: self
		with: #attacks.
	TrikeAsset named: 'Timestamp' in: model.
	self
		should: [receivedEvents size = 4]