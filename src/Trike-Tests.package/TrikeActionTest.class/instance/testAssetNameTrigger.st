event handling
testAssetNameTrigger
	readCleartext
		when: #name
		send: #receiveEvent:
		to: self
		with: #name.
	readCleartext asset: timestamp.
	self
		should: [receivedEvents includes: #name]