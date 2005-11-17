event handling
testSameValueNoTrigger
	cleartext when: #value send: #receiveEvent: to: self with: #value.
	cleartext value: 1000.
	self shouldnt: [receivedEvents includes: #value]