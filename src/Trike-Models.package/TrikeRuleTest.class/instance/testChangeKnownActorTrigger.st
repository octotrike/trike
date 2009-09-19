event handling
testChangeKnownActorTrigger
	isStudent
		when: #knownActor:
		send: #receiveEvent:
		to: self.
	isStudent actor: wizard.
	self
		should: [receivedEvents includes: wizard];
		
		shouldnt: [receivedEvents includes: student]