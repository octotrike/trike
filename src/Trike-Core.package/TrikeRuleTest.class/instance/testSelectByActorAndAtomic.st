selection by actor
testSelectByActorAndAtomic
	"None of my clauses are roles."
	| and1 result |
	and1 := moonIsFull /\ professorForgot.
	result := and1 selectForActor: student.
	self
		should: [result isKindOf: TrikeAndRule].
	self should: [and1 children asSet = result children asSet]