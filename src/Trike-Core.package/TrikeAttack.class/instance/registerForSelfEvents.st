event handling
registerForSelfEvents
	"Register myself for event triggers from myself."
	
	super registerForSelfEvents.
	self when: #children send: #triggerEvent: to: self with: #attacks