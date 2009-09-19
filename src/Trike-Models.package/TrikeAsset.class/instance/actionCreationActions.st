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
								arguments: {true})]].
	^ result