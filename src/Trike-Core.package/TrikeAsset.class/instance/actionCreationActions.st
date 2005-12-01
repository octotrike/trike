event handling
actionCreationActions
	| result |
	result := OrderedCollection new.
	self possibleActions
		do: [:actionSymbol | 
			| action | 
			action := self actionAt: actionSymbol.
			action isIntended
				ifFalse: [result
						add: (GenericAction
								label: actionSymbol
								receiver: action
								selector: #intended:
								arguments: ((Array new: 1) at: 1 put: true; yourself))]].
	^ result