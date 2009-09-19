event handling
testSingleParentKnownActorTrigger
	| or |
	or := moonIsFull \/ isStudent.
	or
				when: #knownActor:
				send: #receiveEvent:
				to: self.
	isStudent actor: wizard.
	self
		should: [receivedEvents includes: wizard];
		
		shouldnt: [receivedEvents includes: student]