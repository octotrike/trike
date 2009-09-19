selection by actor
testSelectByActorOrUnmatchingRole
	"My clauses include an unmatching role."
	| result or1 |
	or1 := moonIsFull \/ isStudent.
	result := or1 selectForActor: wizard.
	self
		should: [result = moonIsFull]