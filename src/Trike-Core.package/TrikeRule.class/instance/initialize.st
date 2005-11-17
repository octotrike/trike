initialization
initialize
	"Set my initial state."
	
	super initialize.
	self 
		when: #name send: #triggerEvent: to: self with: #rule;
		when: #not send: #triggerEvent: to: self with: #name;
		when: #knownActor: send: #passUpKnownActor: to: self