accessing
removeRule: aRule 
	"Remove this rule from my children, without recursing or
	whatnot. "
	rule = aRule
		ifTrue: [self rule: nil]
		ifFalse: [self error: 'Rule not found']