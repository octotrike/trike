event handling
testThreatRuleExistenceNameTrigger
	| threat |
	readCleartext rule: nil.
	threat := readCleartext attacks any.
	threat
		when: #name
		send: #receiveEvent:
		to: self
		with: #name.
	readCleartext
		rule: (TrikeActorRule actor: alice).
	self
		should: [receivedEvents includes: #name]