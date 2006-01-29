event handling
testNameTrigger
	moonIsFull
		when: #name
		send: #receiveEvent:
		to: self
		with: #name.
	moonIsFull name: 'The moon is less than half empty'.
	self
		should: [receivedEvents includes: #name]