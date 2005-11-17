event handling
testAndNoNameTrigger
	"When you attempt to change the name of an AND attack  
	directly, no #name event should be triggered."
	| and |
	and := TrikeAndAttack new.
	and
		when: #name
		send: #receiveEvent:
		to: self
		with: #name.
	self
		should: [and name: 'accomplish all children']
		raise: Error;
		
		shouldnt: [receivedEvents includes: #name]