initialization
initialize
	"Set my initial state."
	super initialize.
	self
		when: #action
		send: #triggerEvent:
		to: self
		with: #name;
		
		when: #riskFactor
		send: #triggerEvent:
		to: self
		with: #exposure;
		
		initializeAttacks