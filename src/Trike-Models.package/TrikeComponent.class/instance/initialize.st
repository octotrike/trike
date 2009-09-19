initialization
initialize
	"Set my initial state."
	super initialize.
	id := UUID new.
	name := ''.
	notes := ''.
	self registerForSelfEvents
