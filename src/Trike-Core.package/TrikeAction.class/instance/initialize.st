initialization
initialize
	"Set my initial state."
	super initialize.
	intended := false.
	knownActors := Set new.
	attacks := Set new.
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
		to: self;
		
		addAttack: (TrikeElevationOfPrivilegeThreat action: self)
		