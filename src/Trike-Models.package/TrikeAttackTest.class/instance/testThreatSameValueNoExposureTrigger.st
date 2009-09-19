event handling
testThreatSameValueNoExposureTrigger
	| threat |
	threat := readCleartext attacks any.
	threat
		when: #exposure
		send: #receiveEvent:
		to: self
		with: #exposure.
	cleartext value: 1000.
	self
		shouldnt: [receivedEvents includes: #exposure]