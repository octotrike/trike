selection by actor
testSelectByActorOrMatchingRole
	"One of my clauses is a role, which matches."
	| result or1 |
	or1 := moonIsFull \/ isStudent.
	result := or1 selectForActor: student.
	self
		should: [result = #Always]