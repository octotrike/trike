event handling
registerForSelfEvents
	"Register myself for event triggers from myself."
	
	super registerForSelfEvents.
	self 
		when: #name send: #triggerEvent: to: self with: #rule;
		when: #children send: #triggerEvent: to: self with: #rule;
		when: #not send: #triggerEvent: to: self with: #name;
		when: #knownActor: send: #passUpKnownActor: to: self