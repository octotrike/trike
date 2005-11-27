event handling
actionCreationActions
	"Answer an OrderedCollection containing all action creation  
	operations my instances support."
	| result |
	result := assets
				collect: [:asset | asset inScope
						ifTrue: [GenericActions
								label: asset name
								receiver: asset
								selector: #actionCreationActions]].
	^ result copyWithout: nil