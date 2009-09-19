event handling
registerForSelfEvents
	"Register myself for event triggers from myself."
	super registerForSelfEvents.
	self
		when: #asset
		send: #triggerEvent:
		to: self
		with: #name;
		
		when: #knownActor:
		send: #applyRuleToActor:
		to: self