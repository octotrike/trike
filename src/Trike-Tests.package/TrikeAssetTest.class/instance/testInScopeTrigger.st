event handling
testInScopeTrigger
	cleartext when: #inScope send: #receiveEvent: to: self with: #inScope.
	cleartext inScope: false.
	self should: [receivedEvents includes: #inScope]