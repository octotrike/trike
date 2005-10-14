event handling
constrainedClauseOperations
	"Answer a SpiralActions containing operations for editing a 
	constrained clause."
	| result current |
	current := currentTreeItem model.
	result := SpiralActions new.
	result label: 'edit clause'.
	(model perform: current class constraintSelector)
		do: [:value | result
				add: (SpiralAction
						label: value name
						buttonLabel: nil
						receiver: self
						selector: #editRule:
						arguments: {value})].
	^ result