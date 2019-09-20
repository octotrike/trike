event handling
testThreatAssetNameTrigger
	| threat |
	threat := readCleartext attacks anyOne.
	threat
		when: #name
		send: #receiveEvent:
		to: self
		with: #name.
	readCleartext asset: timestamp.
	self
		should: [receivedEvents includes: #name]