event handling
testNotNameTrigger
	moonIsFull when: #name send: #receiveEvent: to: self with: #name.
	moonIsFull not: true.
	self should: [receivedEvents includes: #name]
	