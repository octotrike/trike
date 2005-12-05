event handling
adoptRuleAction: child named: aString
	^GenericAction
		label: aString
		receiver: self
		selector: #adoptRule:
		arguments: {child}
		