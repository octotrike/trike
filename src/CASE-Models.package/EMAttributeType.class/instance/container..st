accessing
container: containingDataObject
	"Set my container to containingDataObject, updating containingDataObject to contain me."

	self privateContainer: containingDataObject.
	container privateAddAttribute: self