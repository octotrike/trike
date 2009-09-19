selection by actor
testSelectByActorAndUnmatchingRole
	"One of my clauses is a role, which doesn't match."
	| result and1 |
	and1 := moonIsFull /\ isStudent.
	result := and1 selectForActor: wizard.
	self
		should: [result = #Never]