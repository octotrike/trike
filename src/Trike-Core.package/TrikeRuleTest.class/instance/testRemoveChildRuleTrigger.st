event handling
testRemoveChildRuleTrigger
	| and |
	and := moonIsFull /\ isStudent.
	and
		when: #rule
		send: #receiveEvent:
		to: self
		with: #rule.
	and removeRule: moonIsFull.
	self
		should: [receivedEvents includes: #rule]