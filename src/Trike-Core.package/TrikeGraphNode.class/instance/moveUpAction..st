event handling
moveUpAction: child 
	^ children first == child
		ifFalse: [GenericAction
				label: 'Reorder Selected ' , child label , ' Up'
				receiver: self
				selector: #moveChildUp:
				arguments: {child}]