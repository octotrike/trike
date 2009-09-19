event handling
testActorNoNameTrigger
	"When you attempt to change the name of an actor rule 
	directly, no #name event should be triggered."
	
	isStudent when: #name send: #receiveEvent: to: self with: #name.
	self 
		should: [isStudent name: 'is a Student'] raise: Error;
		shouldnt: [receivedEvents includes: #name]
	
