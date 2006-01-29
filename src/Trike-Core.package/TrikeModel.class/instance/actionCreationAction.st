event handling
actionCreationAction
	"Answer a GenericActions to act as a handle for all action 
	creation operations my instances support."
	| result |
	result := GenericActions
				label: 'Add Intended Action On'
				receiver: self
				selector: #actionCreationActions
				arguments: #().
	result description: 'allow an action which is currently not intended'.
	^ result