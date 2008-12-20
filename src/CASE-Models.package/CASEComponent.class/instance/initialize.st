initialization
initialize
	"Set my initial state."
	
	super initialize.
	components := self newComponents.
	issues := Set new.
	requiresUniqueLabels := self defaultRequiresUniqueLabels
	