event handling
testOrNoNameTrigger
	"When you attempt to change the name of an OR rule 
	directly, no #name event should be triggered."
	| or |
	or := moonIsFull \/ professorForgot.
	or
		when: #name
		send: #receiveEvent:
		to: self
		with: #name.
	self
		should: [or name: 'Either condition is true']
		raise: Error;
		
		shouldnt: [receivedEvents includes: #name]