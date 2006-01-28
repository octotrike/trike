event handling
moveDownAction: child 
	^ children last == child
		ifFalse: [GenericAction
				label: 'Reorder Selected ' , child label , ' Down'
				receiver: self
				selector: #moveChildDown:
				arguments: {child}]