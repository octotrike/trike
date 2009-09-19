event handling
adoptChildAction: child named: aString 
	^ self canHaveChildren
		ifTrue: [GenericAction
				label: aString
				receiver: self
				selector: #adoptChild:
				arguments: {child}]