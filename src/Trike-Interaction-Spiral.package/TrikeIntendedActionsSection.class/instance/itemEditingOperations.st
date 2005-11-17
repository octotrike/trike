event handling
itemEditingOperations
	"Answer a SpiralActions containing all rule editing operations  
	my instances support."
	| result operation current |
	current := currentTreeItem model.
	result := OrderedCollection new.
	operation := self actionCreationAction.
	operation
		ifNotNil: [result add: operation].
	current topLevel
		ifFalse: [result
				add: (self newRuleOperations: #sibling)].
	current canHaveChildren
		ifTrue: [operation := self newRuleOperations: #child.
			current topLevel
				ifTrue: [operation label: (current hasRules
							ifTrue: ['also ']
							ifFalse: [''])
							, 'allow ' , current label , ' when';
						 help: 'add a condition under which this action can occur'].
			result add: operation].
	(current hasDerivedName
			and: [current isEditable])
		ifTrue: [result add: self constrainedClauseOperations].
	current topLevel
		ifTrue: [operation := GenericAction
						label: 'always allow ' , current label
						receiver: self
						selector: #removeAllRules
						arguments: #().
			operation help: 'allow this action to occur under all conditions']
		ifFalse: [operation := GenericAction
						label: 'remove selected rule'
						receiver: self
						selector: #removeRule
						arguments: #()].
	result add: operation.
	current topLevel
		ifTrue: [operation := GenericAction
						label: 'disallow ' , current label
						receiver: self
						selector: #removeAction
						arguments: #().
			operation help: 'never allow this action to occur, under any condition'.
			result add: operation].
	^ result