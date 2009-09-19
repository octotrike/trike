event handling
testNotesTrigger
	cleartext when: #notes send: #receiveEvent: to: self with: #notes.
	cleartext notes: 'The super-secret message Alice wants to send to Bob.'.
	self should: [receivedEvents includes: #notes]