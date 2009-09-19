event handling
addNodeTo: parent withConstraint: actor
	"Add a new instance of me to the given parent."
	parent addRule: (self actor: actor)