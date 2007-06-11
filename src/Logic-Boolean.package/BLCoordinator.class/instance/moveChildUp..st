accessing
moveChildUp: aChild
	| index |
	index := children identityIndexOf: aChild.
	children swap: index with: (index - 1).
	self triggerEvent: #children