accessing
addObject: newDataObject 
	"Add a data object from my model to this zone."
	model
		ifNil: [EMInconsistency signal: 'undefined model cannot contain data object being added to zone'].
	newDataObject
		ifNil: [EMInconsistency signal: 'cannot add undefined data object to zone'].
	(model includesObject: newDataObject)
		ifFalse: [EMInconsistency signal: 'data object being added to zone does not appear in model'].
	objects add: newDataObject.
	self triggerEvent: #addObject: with: newDataObject