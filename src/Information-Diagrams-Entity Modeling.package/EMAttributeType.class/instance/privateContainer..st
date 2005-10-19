accessing
privateContainer: containingDataObject
	"Set my container to containingDataObject, without telling containingDataObject to contain me."

	container ifNotNil: [
		container privateRemoveAttribute: self ].
	container := containingDataObject