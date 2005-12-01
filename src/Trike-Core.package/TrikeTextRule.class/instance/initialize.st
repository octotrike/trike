initialization
initialize
	"Set my initial state."
	
	super initialize.
	self 
		when: #name send: #changed: to: self with: #name