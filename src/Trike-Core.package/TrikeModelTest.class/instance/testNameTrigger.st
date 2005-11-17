event handling
testNameTrigger
	model when: #name send: #receiveEvent: to: self with: #name.
	model name: 'random name'.
	self should: [receivedEvents includes: #name]
	