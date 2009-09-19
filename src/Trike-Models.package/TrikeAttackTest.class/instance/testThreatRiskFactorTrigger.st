event handling
testThreatRiskFactorTrigger
	| threat |
	threat := readCleartext attacks any.
	threat
		when: #riskFactor
		send: #receiveEvent:
		to: self
		with: #riskFactor.
	threat riskFactor: 5.
	self
		should: [receivedEvents includes: #riskFactor]