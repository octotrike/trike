event handling
testThreatRuleNonexistenceNameTrigger
	| dos elv |
	dos := readCleartext attacks
				detect: [:attack | attack isLess].
	dos
		when: #name
		send: #receiveEvent:
		to: self
		with: #dos.
	elv := readCleartext attacks
				detect: [:attack | attack isMore].
	elv
		when: #name
		send: #receiveEvent:
		to: self
		with: #elv.
	readCleartext rule: nil.
	self
		should: [receivedEvents includes: #dos].
	self
		shouldnt: [receivedEvents includes: #elv]