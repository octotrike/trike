event handling
sectionEditingActions
	"Answer an OrderedCollection containing all section editing
	actions my instances support."
	| result action |
	result := OrderedCollection new.
	action := GenericAction
				label: 'Export'
				receiver: self
				selector: #save
				arguments: #().
	action description: 'Save this model in native XML format.'.
	result add: action.
	action := GenericAction
				label: 'Close!'
				receiver: self
				selector: #close
				arguments: #().
	action description: 'Close this model, DELETING ALL DATA which has not been exported.'.
	result add: action.
	^ result