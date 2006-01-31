event handling
registerForSelfEvents
	"Register myself for event triggers from myself."
	super registerForSelfEvents.
	self
		when: #children
		send: #triggerEvent:
		to: self
		with: #attacks;

		when: #name
		send: #triggerEvent:
		to: self
		with: #attacks;

		when: #anAttack:
		send: #passUpAnAttack:
		to: self;

		when: #noAttack:
		send: #passUpNoAttack:
		to: self