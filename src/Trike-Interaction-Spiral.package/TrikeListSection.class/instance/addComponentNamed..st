event handling
addComponentNamed: aString 
	"Add a new component with the given name to my model."
	model perform: self modelComponentCreationSelector with: aString.
	self resetComponentCreator