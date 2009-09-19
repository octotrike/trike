event handling
testValueTrigger
	cleartext when: #value send: #receiveEvent: to: self with: #value.
	cleartext value: 2000.
	self should: [receivedEvents includes: #value]