event handling
removeAction: child 
	^ GenericAction
		label: 'remove selected ', child label
		receiver: self
		selector: #removeChild:
		arguments: {child}