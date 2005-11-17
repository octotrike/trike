event handling
testRiskTrigger
	alice when: #risk send: #receiveEvent: to: self with: #risk.
	alice risk: 1.
	self should: [receivedEvents includes: #risk]