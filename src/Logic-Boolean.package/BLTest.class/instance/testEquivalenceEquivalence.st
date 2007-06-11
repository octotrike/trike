test representation equivalence
testEquivalenceEquivalence
	| a2 notA2 |
	a2 := BLAtomicTerm on: 'A'.
	notA2 := a2 negated.
	self
		should: [a = a2];
		
		should: [notA = notA2];
		
		should: [(a /\ b) = (a /\ b)];
		
		should: [(a \/ b) = (a \/ b)];
		
		should: [(a /\ b) = (a2 /\ b)]