event handling
testThreatRiskFactorExposureTrigger
	| threat |
	threat := readCleartext attacks any.
	threat
		when: #exposure
		send: #receiveEvent:
		to: self
		with: #exposure.
	threat riskFactor: 5.
	self
		should: [receivedEvents includes: #exposure]