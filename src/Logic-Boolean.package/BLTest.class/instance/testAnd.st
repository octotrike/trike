test Boolean logic
testAnd
	| result1 result2 result1Children result2Children |
	result1 := a /\ b.
	result2 := b /\ a.
	result1Children := result1 children.
	result2Children := result2 children.
	self
		should: [result1 isAnd].
	self
		should: [result1Children size = 2].
	self
		should: [result1Children includes: a].
	self
		should: [result1Children includes: b].
	self
		should: [result1Children asSet = result2Children asSet]