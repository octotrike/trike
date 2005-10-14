initialization
initialize
	"Set my initial state."
	super initialize.
	intended := false.
	knownActors := Set new.
	attacks := Set new.
	self addAttack: (TrikeElevationOfPrivilegeThreat action: self)