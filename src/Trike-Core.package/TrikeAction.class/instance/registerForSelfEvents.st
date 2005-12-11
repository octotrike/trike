event handling
registerForSelfEvents
	"Register myself for event triggers from myself."
	
	super registerForSelfEvents.
	self
		when: #asset
		send: #triggerEvent:
		to: self
		with: #name;
		
		when: #anAttack:
		send: #passUpAnAttack:
		to: self;
		
		when: #noAttack:
		send: #passUpNoAttack:
		to: self