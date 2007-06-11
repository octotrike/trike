test Boolean logic
testOr
	| result1 result2 result1Children result2Children |
	result1 := a \/ b.
	result2 := b \/ a.
	result1Children := result1 children.
	result2Children := result2 children.
	self
		should: [result1 isOr];
		
		should: [result1Children size = 2];
		
		should: [result1Children includes: a];
		
		should: [result1Children includes: b];
		
		should: [result1Children asSet = result2Children asSet]