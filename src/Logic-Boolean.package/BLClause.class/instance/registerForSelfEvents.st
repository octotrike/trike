change notification
registerForSelfEvents
	"Register myself for event triggers from myself."
	
	self 
		needsWork;
		when: #string send: #triggerEvent: to: self with: #clause;
		when: #children send: #triggerEvent: to: self with: #clause;
		when: #negated send: #triggerEvent: to: self with: #string