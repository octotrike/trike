event handling
testNameTrigger
	alice when: #name send: #receiveEvent: to: self with: #name.
	alice name: '3Jane'.
	self should: [receivedEvents includes: #name]
	