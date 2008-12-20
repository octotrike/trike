initialization
initialize
	"Set my initial state."
	
	super initialize.
	components := IdentitySet new.
	history := OrderedCollection new.
	isActive := true.