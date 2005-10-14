event handling
actionCreationOperation
	"Answer a SpiralActions containing all action creation 
	operations my instances support."
	| result |
	(currentTreeItem notNil
			and: [currentTreeItem model topLevel not])
		ifTrue: [^ nil].
	result := SpiralActions new.
	result label: 'add intended action on';
		 help: 'allow an action which doesn''t appear on this list'.
	model assets
		do: [:asset | asset inScope
				ifTrue: [| operation | 
					operation := SpiralActions new.
					operation label: asset name.
					asset possibleActions
						do: [:actionSymbol | (asset actionAt: actionSymbol)
								ifNil: [operation
										add: (SpiralAction
												label: actionSymbol asString
												buttonLabel: nil
												receiver: self
												selector: #addAction:on:
												arguments: {actionSymbol. asset})]].
					operation
						ifNotEmpty: [result add: operation]]].
	^ result
		ifNotEmpty: [result]
		ifEmpty: []