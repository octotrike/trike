event handling
clauseEditingActions
	"Answer an OrderedCollection of GenericActions for editing my clause.  This is relevant only if I have a derived/constrained clause."
	
	^model actors
		collect: [:value | GenericAction
						label: value name
						receiver: self
						selector: #actor:
						arguments: {value}].