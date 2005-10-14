event handling
newAttackOperations: relationSymbol 
	"Answer a SpiralActions containing operations for adding each 
	type of rule I support, in the given relation to currentTreeItem."
	| result |
	result := SpiralActions new.
	result label: 'add ' , relationSymbol asString asLowercase , ' attack'.
	TrikeAttack concreteSubclasses
		do: [:c | 
			| operation | 
			c hasDerivedName
				ifTrue: [operation := SpiralActions new.
					operation label: c label.
					(model perform: c constraintSelector)
						do: [:value | operation
								add: (SpiralAction
										label: value name
										buttonLabel: nil
										receiver: self
										selector: #addAttackOfClass:with:as:
										arguments: {c. value. relationSymbol})]]
				ifFalse: [operation := SpiralAction
								label: c label
								buttonLabel: nil
								receiver: self
								selector: #addAttackOfClass:as:
								arguments: {c. relationSymbol}].
			result add: operation].
	^ result