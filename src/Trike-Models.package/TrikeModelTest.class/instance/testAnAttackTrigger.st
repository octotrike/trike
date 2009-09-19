event handling
testAnAttackTrigger
	"Adding a threat should trigger #anAttack:. The easiest way to  
	add a threat is to add an asset."
	model
		when: #anAttack:
		send: #receiveEvent:
		to: self.
	TrikeAsset named: 'Timestamp' in: model.
	self
		should: [receivedEvents first isMore];
		
		should: [receivedEvents size = 4]