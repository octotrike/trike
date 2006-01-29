event handling
removeAction: child 
	| selector |
	child == rule
		ifTrue: [selector := #removeRule:]
		ifFalse: [self error: 'No such child'].
	^ GenericAction
		label: 'Remove Selected ' , child label
		receiver: self
		selector: selector
		arguments: {child}