event handling
testAddChildKnownActorTrigger
	| and |
	and := moonIsFull /\ isStudent.
	and
		when: #knownActor:
		send: #receiveEvent:
		to: self.
	and addRule: isWizard.
	self
		should: [receivedEvents includes: wizard]