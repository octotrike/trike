event handling
testNameTrigger
	cleartext
		when: #name
		send: #receiveEvent:
		to: self
		with: #name.
	cleartext name: 'unencrypted message'.
	self
		should: [receivedEvents includes: #name]