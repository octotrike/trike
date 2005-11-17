operations
modelCreationActions
	"Answer an OrderedCollection containing all model creation actions  
	my instances support."
	| result |
	result := OrderedCollection new.
	result
		add: (GenericAction
				label: 'new'
				receiver: self
				selector: #addPage
				arguments: #()).
	^ result