event handling
registerForSelfEvents
	"Register myself for event triggers from myself."
	
	super registerForSelfEvents.
	self
		when: #action
		send: #triggerEvent:
		to: self
		with: #name;
		
		when: #riskFactor
		send: #triggerEvent:
		to: self
		with: #exposure;

		when: #exposure
		send: #attacksChanged
		to: self;

		when: #attacks
		send: #attacksChanged
		to: self