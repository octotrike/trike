running
testIsIssue
	| i |
	i := self targetClass on: #().
	
	self shouldnt: [i isIssue].

