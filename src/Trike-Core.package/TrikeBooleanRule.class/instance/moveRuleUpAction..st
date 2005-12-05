event handling
moveRuleUpAction: child 
	^ children first == child
		ifTrue: [nil]
		ifFalse: [GenericAction
					label: 'move selected rule up'
					receiver: self
					selector: #moveRuleUp:
					arguments: {child}]