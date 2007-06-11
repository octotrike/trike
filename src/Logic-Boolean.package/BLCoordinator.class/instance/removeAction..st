actions
removeAction: child 
	^ GenericAction
		label: 'Remove Selected ' , child label
		receiver: self
		selector: #removeChild:
		arguments: {child}