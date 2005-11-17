event handling
testGrandparentKnownActorTrigger
	| or1 or2 and1 |
	or1 := moonIsFull \/ isStudent.
	or2 := timeMovingForwards \/ creatureLives.
	and1 := or1 /\ or2.
	and1
		when: #knownActor:
		send: #receiveEvent:
		to: self.
	isStudent actor: wizard.
	self
		should: [receivedEvents includes: wizard]