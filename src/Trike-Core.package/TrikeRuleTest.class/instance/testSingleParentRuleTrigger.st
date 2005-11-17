event handling
testSingleParentRuleTrigger
	| or |
	or := moonIsFull \/ professorForgot.
	or
		when: #rule
		send: #receiveEvent:
		to: self
		with: #rule.
	moonIsFull name: 'the moon is less than half empty'.
	self
		should: [receivedEvents includes: #rule]