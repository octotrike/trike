event handling
testThreatRuleExistingExistenceNoNameTrigger
	| threat |
	threat := readCleartext attacks anyOne.
	threat
		when: #name
		send: #receiveEvent:
		to: self
		with: #name.
	readCleartext
		rule: (TrikeActorRule actor: alice).
	self
		shouldnt: [receivedEvents includes: #name]