event handling
testThreatRiskFactorTrigger
	| threat |
	threat := readCleartext attacks anyOne.
	threat
		when: #riskFactor
		send: #receiveEvent:
		to: self
		with: #riskFactor.
	threat riskFactor: 5.
	self
		should: [receivedEvents includes: #riskFactor]