event handling
testActorNameNameTrigger
	isStudent when: #name send: #receiveEvent: to: self with: #name.
	student name: 'Muggle'.
	self should: [receivedEvents includes: #name]
	