event handling
testThreatSameValueNoExposureTrigger
	| threat |
	threat := readCleartext attacks anyOne.
	threat
		when: #exposure
		send: #receiveEvent:
		to: self
		with: #exposure.
	cleartext value: 1000.
	self
		shouldnt: [receivedEvents includes: #exposure]