test representation equivalence
testHashEquivalence
	| a2 notA2 |
	a2 := BLAtomicTerm on: 'A'.
	notA2 := a2 negated.
	self
		should: [a hash = a2 hash];
		should: [notA hash = notA2 hash];
		should: [(a /\ b) hash = (a /\ b) hash];
		should: [(a \/ b) hash = (a \/ b) hash];
		should: [(a /\ b) hash = (a2 /\ b) hash]