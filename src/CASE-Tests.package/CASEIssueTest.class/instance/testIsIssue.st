running
testIsIssue
	| i |
	i := self targetClass on: #().
	
	self should: [i isIssue].