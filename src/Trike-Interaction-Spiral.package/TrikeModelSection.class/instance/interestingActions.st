event handling
interestingActions
	"Answer an OrderedCollection containing all operation
	categories 
	that are interesting for me."
	| result |
	result := OrderedCollection new.
	result
		add: (GenericActions
				label: 'Book Editing'
				receiver: self
				selector: #bookEditingActions
				arguments: #()).
	^ result