selection by actor
testSelectByActorAndMatchingRole
	"One of my clauses is a role, which matches."
	| and1 result |
	and1 := moonIsFull /\ isStudent.
	result := and1 selectForActor: student.
	self
		should: [result = moonIsFull]