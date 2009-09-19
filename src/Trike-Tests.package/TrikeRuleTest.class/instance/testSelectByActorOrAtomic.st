selection by actor
testSelectByActorOrAtomic
	"None of my clauses are roles."
	| or result |
	or := moonIsFull \/ professorForgot.
	result := or selectForActor: student.
	self
		should: [result isKindOf: TrikeOrRule].
	self
		should: [or children asSet = result children asSet]