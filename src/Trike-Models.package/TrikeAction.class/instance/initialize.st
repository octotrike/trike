initialization
initialize
	"Set my initial state."
	super initialize.
	intended := false.
	attacks := Set new.
	self 
		initializeKnownActors;
		addAttack: (TrikeElevationOfPrivilegeThreat action: self)
		