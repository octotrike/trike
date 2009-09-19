event handling
testNotesTrigger
	alice
		when: #notes
		send: #receiveEvent:
		to: self
		with: #notes.
	alice notes: 'The sender/creator of a message.'.
	self
		should: [receivedEvents includes: #notes]