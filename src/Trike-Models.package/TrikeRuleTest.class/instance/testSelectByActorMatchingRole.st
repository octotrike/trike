selection by actor
testSelectByActorMatchingRole
	| result |
	result := isStudent selectForActor: student.
	self
		should: [result = #Always]