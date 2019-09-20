event handling
testThreatValueExposureTrigger
	| threat |
	threat := readCleartext attacks anyOne.
	threat
		when: #exposure
		send: #receiveEvent:
		to: self
		with: #exposure.
	cleartext value: 2000.
	self
		should: [receivedEvents includes: #exposure]