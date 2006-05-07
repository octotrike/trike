accessing
removeObject: formerDataObject 
	"Remove a data object from this zone."
	formerDataObject
		ifNil: [EMInconsistency signal: 'cannot remove undefined data object from zone'].
	objects
		remove: formerDataObject
		ifAbsent: [EMInconsistency signal: 'cannot remove nonexistent data object from zone'].
	self triggerEvent: #removeObject: with: formerDataObject