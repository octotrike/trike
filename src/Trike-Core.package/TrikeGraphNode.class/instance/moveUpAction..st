event handling
moveUpAction: child 
	^ children first == child
		ifTrue: [nil]
		ifFalse: [GenericAction
					label: 'reorder selected ', child label, ' up'
					receiver: self
					selector: #moveChildUp:
					arguments: {child}]