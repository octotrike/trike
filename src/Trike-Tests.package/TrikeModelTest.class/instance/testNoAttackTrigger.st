event handling
testNoAttackTrigger
	"Removing a threat should trigger #noAttack:."
	model
		when: #noAttack:
		send: #receiveEvent:
		to: self.
	createCleartext rule: nil.
	self
		should: [receivedEvents first isMore];
		
		should: [receivedEvents size = 1]