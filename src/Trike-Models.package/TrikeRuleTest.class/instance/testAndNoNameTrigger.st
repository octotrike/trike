event handling
testAndNoNameTrigger
	"When you attempt to change the name of an AND rule 
	directly, no #name event should be triggered."
	| and |
	and := moonIsFull /\ professorForgot.
	and
		when: #name
		send: #receiveEvent:
		to: self
		with: #name.
	self
		should: [and name: 'Both conditions are true']
		raise: Error;
		
		shouldnt: [receivedEvents includes: #name]