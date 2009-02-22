initialization
initialize
	"Set my initial state."
	
	super initialize.
	components := self newComponents.
	implications := Set new.
	