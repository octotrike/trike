event handling
promoteRuleAction: child 
	| proposedParent |
	proposedParent := [self parents only] on: Error do: [^nil].
	^proposedParent ifNotNil: [
		proposedParent adoptRuleAction: child named: 'promote selected rule']