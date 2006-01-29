event handling
testNoNameTrigger
	"When you attempt to change the name of an action 
	directly, no #name event should be triggered."
	createCleartext
		when: #name
		send: #receiveEvent:
		to: self
		with: #name.
	self
		should: [createCleartext name: 'Decrypt that puppy']
		raise: Error;
		
		shouldnt: [receivedEvents includes: #name]