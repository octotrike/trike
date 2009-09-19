event handling
testNameTrigger
	model
		when: #name
		send: #receiveEvent:
		to: self
		with: #name.
	model name: 'Random Name'.
	self
		should: [receivedEvents includes: #name]