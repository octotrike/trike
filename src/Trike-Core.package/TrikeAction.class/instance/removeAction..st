event handling
removeAction: child 
	| selector |
	child == rule 
		ifTrue: [selector := #removeRule:]
		ifFalse: [self error: 'no such child'].
	^ GenericAction
		label: 'remove selected ', child label
		receiver: self
		selector: selector
		arguments: {child}