selection by actor
testSelectByActorUnmatchingRole
	| result |
	result := isStudent selectForActor: wizard.
	self
		should: [result = #Never]