event handling
addComponentNamed: aString 
	"Add a new component with the given name to my model."
	
	self componentClass named: aString in: model.
	self resetComponentCreator