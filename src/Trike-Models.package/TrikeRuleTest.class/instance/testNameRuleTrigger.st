event handling
testNameRuleTrigger
	moonIsFull
		when: #rule
		send: #receiveEvent:
		to: self
		with: #rule.
	moonIsFull name: 'The moon is less than half empty'.
	self
		should: [receivedEvents includes: #rule]