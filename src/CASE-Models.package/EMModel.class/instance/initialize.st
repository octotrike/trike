initialization
initialize
	"Set my initial state."
	
	super initialize.
	designation := nil.
	description := nil.
	namedObjects := Dictionary new.
	objects := IdentitySet new.
	connections := IdentitySet new.
	zones := Dictionary new