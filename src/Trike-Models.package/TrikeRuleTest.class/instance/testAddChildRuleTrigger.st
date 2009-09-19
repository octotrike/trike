event handling
testAddChildRuleTrigger
	| and |
	and := moonIsFull /\ isStudent.
	and
		when: #rule
		send: #receiveEvent:
		to: self
		with: #rule.
	and addRule: timeMovingForwards.
	self
		should: [receivedEvents includes: #rule]