operations
bookEditingActions
	"Answer an OrderedCollection containing all book editing operations  
	my instances support."
	| result |
	result := self modelCreationActions.
	result
		add: (GenericAction
				label: 'close'
				receiver: self
				selector: #removePage
				arguments: #()).
	^ result