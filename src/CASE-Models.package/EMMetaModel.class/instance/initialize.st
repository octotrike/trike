initialization
initialize
	"Set my initial state. In my case, much of my initial state is not
	changeable over my lifetime."
	
	super initialize.
	description := 'A mostly-constant entity model of entity models in general.  Some of my rules can be enabled, disabled and configured; this will affect enforcement of rules in the entityModel with which I am associated.'.
	self
		addEntities;
		setDeterminants;
		addConnections.
	enforcementTime := #instantly