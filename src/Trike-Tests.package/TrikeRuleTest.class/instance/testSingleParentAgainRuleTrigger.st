event handling
testSingleParentAgainRuleTrigger
	| or1 or2 |
	or1 := moonIsFull \/ professorForgot.
	or2 := moonIsFull \/ creatureLives.
	or1
		when: #rule
		send: #receiveEvent:
		to: self
		with: #rule1.
	or2
		when: #rule
		send: #receiveEvent:
		to: self
		with: #rule2.
	or2 removeRule: moonIsFull.
	self clearReceivedEvents.
	moonIsFull name: 'The moon is less than half empty'.
	self
		should: [receivedEvents includes: #rule1];
		
		shouldnt: [receivedEvents includes: #rule2]