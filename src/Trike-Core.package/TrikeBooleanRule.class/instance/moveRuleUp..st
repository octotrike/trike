accessing
moveRuleUp: rule
	| index |
	index := children identityIndexOf: rule.
	children swap: index with: (index - 1).
	self triggerEvent: #rule