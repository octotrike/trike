event handling
moveDownAction: child 
	^ children last == child
		ifTrue: [nil]
		ifFalse: [GenericAction
					label: 'reorder selected ', child label, ' down'
					receiver: self
					selector: #moveChildDown:
					arguments: {child}]