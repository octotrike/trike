event handling
clauseEditingActions
	"Answer an OrderedCollection of GenericActions for editing my 
	clause. This is relevant only if I have a derived/constrained 
	clause. "
	^ (actor model actors
		collect: [:value | 
			value = actor 
				ifTrue: [nil]
				ifFalse: [GenericAction
				label: value name
				receiver: self
				selector: #actor:
				arguments: {value}]]) copyWithout: nil