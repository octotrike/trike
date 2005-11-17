event handling
testThreatExposureAttacksTrigger
	| threat |
	threat := createCleartext attacks any.
	model
		when: #attacks
		send: #receiveEvent:
		to: self
		with: #attacks.
	threat riskFactor: 5.
	self
		should: [receivedEvents includes: #attacks]