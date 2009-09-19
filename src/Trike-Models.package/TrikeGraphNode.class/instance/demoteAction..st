event handling
demoteAction: child 
	| proposedParent index parentIndex |
	index := children identityIndexOf: child.
	parentIndex := index - 1.
	parentIndex < 1
		ifTrue: [^ nil].
	proposedParent := children at: parentIndex.
	^ proposedParent
		ifNotNil: [proposedParent adoptChildAction: child named: 'Demote Selected ' , child label]