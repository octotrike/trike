event handling
testThreatSameRiskFactorNoTrigger
	| threat |
	threat := readCleartext attacks anyOne.
	threat riskFactor: 5.
	threat
		when: #riskFactor
		send: #receiveEvent:
		to: self
		with: #riskFactor.
	threat riskFactor: 5.
	self
		shouldnt: [receivedEvents includes: #riskFactor]