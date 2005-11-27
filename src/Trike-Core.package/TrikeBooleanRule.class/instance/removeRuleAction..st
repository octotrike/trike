event handling
removeRuleAction: child 
	^ GenericAction
		label: 'remove rule'
		receiver: self
		selector: #removeRule:
		arguments: {child}