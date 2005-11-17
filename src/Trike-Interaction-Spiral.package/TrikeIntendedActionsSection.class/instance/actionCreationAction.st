event handling
actionCreationAction
	"Answer a GenericActions to act as a handle for all action 
	creation  
	operations my instances support."
	| result |
	result := GenericActions
				label: 'add intended action on'
				receiver: self
				selector: #actionCreationActions
				arguments: #().
	result description: 'allow an action which doesn''t appear on this list'.
	^ result