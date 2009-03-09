running
testImplicitDeleteIsAllowed
	| i session |
	i := self targetClass on: #().
	session := self session.
	session add: i.
	
	"When first created, an Implication should allow implicit deletion."
	self should: [i isImplicitDeleteAllowed].
	
	"When explicit delete is required, an Implication should not allow implicit deletion."
	i requireExplicitDelete.
	self shouldnt: [i isImplicitDeleteAllowed].
	
	"When implicit delete is allowed, an Implication should allow implicit deletion."
	i allowImplicitDelete.
	self should: [i isImplicitDeleteAllowed].

	session remove: i.