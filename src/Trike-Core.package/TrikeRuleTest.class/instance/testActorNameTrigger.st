event handling
testActorNameTrigger
	isStudent when: #name send: #receiveEvent: to: self with: #name.
	isStudent actor: wizard.
	self should: [receivedEvents includes: #name]