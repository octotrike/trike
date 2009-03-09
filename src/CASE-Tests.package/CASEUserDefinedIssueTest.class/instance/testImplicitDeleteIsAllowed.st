running
testImplicitDeleteIsAllowed
	| i session |
	i := self targetClass on: #().
	session := self session.
	session add: i.
	
	"When first created, a UserDefinedIssue should not allow implicit deletion."
	self shouldnt: [i isImplicitDeleteAllowed].
	
	"When explicit delete is required, an Implication should not allow implicit deletion."
	i requireExplicitDelete.
	self shouldnt: [i isImplicitDeleteAllowed].
	
	"Implicit delete is never allowed for UserDefinedIssues."
	self should: [i allowImplicitDelete] raise: Error.
	self shouldnt: [i isImplicitDeleteAllowed].
	
	session remove: i.