accessing
addObject: newDataObject 
	"Add a data object to my model."
	newDataObject
		ifNil: [EMInconsistency signal: 'cannot add undefined data object to model'].
	objects add: newDataObject.
	newDataObject nameMustBeUnique ifTrue: [
		namedObjects at: newDataObject designation put: newDataObject
			ifPresent: [EMInconsistency signal: 'object name is not unique']].
	self triggerEvent: #addObject: with: newDataObject