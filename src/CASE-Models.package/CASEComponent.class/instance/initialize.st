initialization
initialize
	"Set my initial state."
	
	super initialize.
	components := self newComponents.
	implementations := self newImplementations.
	implications := self newImplications.
