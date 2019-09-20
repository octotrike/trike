event handling
testThreatRiskFactorExposureTrigger
	| threat |
	threat := readCleartext attacks anyOne.
	threat
		when: #exposure
		send: #receiveEvent:
		to: self
		with: #exposure.
	threat riskFactor: 5.
	self
		should: [receivedEvents includes: #exposure]