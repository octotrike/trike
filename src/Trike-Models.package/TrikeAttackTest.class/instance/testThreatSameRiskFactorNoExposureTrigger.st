event handling
testThreatSameRiskFactorNoExposureTrigger
	| threat |
	threat := readCleartext attacks anyOne.
	threat riskFactor: 5.
	threat
		when: #exposure
		send: #receiveEvent:
		to: self
		with: #exposure.
	threat riskFactor: 5.
	self
		shouldnt: [receivedEvents includes: #exposure]