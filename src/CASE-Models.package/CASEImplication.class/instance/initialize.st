initialization
initialize
	"Set my initial state."
	
	super initialize.
	components := IdentitySet new.
	implicitDeleteIsAllowed := true
