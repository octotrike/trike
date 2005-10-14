boolean logic
testOr
	| result1 result2 result1Children result2Children |
	result1 := moonIsFull \/ professorForgot.
	result2 := professorForgot \/ moonIsFull.
	result1Children := result1 children.
	result2Children := result2 children.
	self
		should: [result1 isKindOf: TrikeOrRule].
	self
		should: [result1Children size = 2].
	self
		should: [result1Children includes: moonIsFull].
	self
		should: [result1Children includes: professorForgot].
	self
		should: [result1Children asSet = result2Children asSet]