event handling
removeRuleAction: child 
	^ GenericAction
		label: 'remove selected rule'
		receiver: self
		selector: #removeRule:
		arguments: {child}