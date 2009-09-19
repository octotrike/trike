event handling
testGrandparentRuleTrigger
	| or1 or2 and1 |
	or1 := moonIsFull \/ professorForgot.
	or2 := timeMovingForwards \/ creatureLives.
	and1 := or1 /\ or2.
	and1
		when: #rule
		send: #receiveEvent:
		to: self
		with: #rule.
	moonIsFull name: 'The moon is less than half empty'.
	self
		should: [receivedEvents includes: #rule]