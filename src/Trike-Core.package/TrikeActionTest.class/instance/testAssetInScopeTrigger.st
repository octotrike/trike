event handling
testAssetInScopeTrigger
	cleartext
		when: #inScope
		send: #receiveEvent:
		to: self
		with: #inScope.
	cleartext toggleInScope.
	self
		should: [receivedEvents includes: #inScope]