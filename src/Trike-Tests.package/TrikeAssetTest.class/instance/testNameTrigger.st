event handling
testNameTrigger
	cleartext
		when: #name
		send: #receiveEvent:
		to: self
		with: #name.
	cleartext name: 'Unencrypted Message'.
	self
		should: [receivedEvents includes: #name]