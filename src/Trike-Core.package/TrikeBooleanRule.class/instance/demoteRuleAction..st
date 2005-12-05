event handling
demoteRuleAction: child 
	| proposedParent index parentIndex |
	index := children identityIndexOf: child.
	parentIndex := index - 1.
	parentIndex < 1 ifTrue: [^nil].
	proposedParent := children at: parentIndex.
	^ proposedParent
		ifNotNil: [proposedParent adoptRuleAction: child named: 'demote selected rule']