accessing
addObject: newDataObject 
	"Add a data object to my model."
	newDataObject
		ifNil: [EMInconsistency signal: 'cannot add undefined data object to model'].
	newDataObject nameMustBeUnique ifTrue: [ | name |
		name := newDataObject designation.
		namedObjects at: name ifPresent: [EMInconsistency signal: 'object name is not unique'].
		namedObjects at: name put: newDataObject].
	objects add: newDataObject.
	self triggerEvent: #addObject: with: newDataObject