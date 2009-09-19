event handling
testThreatActionNameTrigger
	| threat |
	threat := readCleartext attacks any.
	threat
		when: #name
		send: #receiveEvent:
		to: self
		with: #name.
	threat action: createCleartext.
	self
		should: [receivedEvents includes: #name]