operations
interestingActions
	"Answer an OrderedCollection containing all operation categories  
	that are interesting for me."
	| result |
	result := OrderedCollection new.
	result
		add: (GenericActions
				label: 'book editing'
				receiver: self
				selector: #bookEditingActions
				arguments: #()).
	^ result