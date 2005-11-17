event handling
testNameTrigger
	moonIsFull when: #name send: #receiveEvent: to: self with: #name.
	moonIsFull name: 'the moon is less than half empty'.
	self should: [receivedEvents includes: #name]
	