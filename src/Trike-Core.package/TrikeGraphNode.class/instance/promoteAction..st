event handling
promoteAction: child 
	| proposedParent |
	proposedParent := [self parents only] on: Error do: [^nil].
	^proposedParent ifNotNil: [
		proposedParent adoptChildAction: child named: 'promote selected ', child label]