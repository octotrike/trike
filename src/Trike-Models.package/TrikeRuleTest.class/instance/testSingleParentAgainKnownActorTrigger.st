event handling
testSingleParentAgainKnownActorTrigger
	| or1 or2 |
	or1 := isStudent \/ professorForgot.
	or2 := isStudent \/ creatureLives.
	or1
		when: #knownActor:
		send: #receiveEvent:
		to: self.
	or2
		when: #knownActor:
		send: #receiveEvent:
		to: self.
	or2 removeRule: isStudent.
	self clearReceivedEvents.
	isStudent actor: wizard.
	self
		should: [receivedEvents includes: wizard];
		
		should: [receivedEvents size = 1]