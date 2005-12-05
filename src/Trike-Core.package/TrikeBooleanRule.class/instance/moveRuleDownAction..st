event handling
moveRuleDownAction: child 
	^ children last == child
		ifTrue: [nil]
		ifFalse: [GenericAction
					label: 'move selected rule down'
					receiver: self
					selector: #moveRuleDown:
					arguments: {child}]