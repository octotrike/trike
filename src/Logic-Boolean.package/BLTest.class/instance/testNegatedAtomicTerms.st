test Boolean logic
testNegatedAtomicTerms
	| result or1 and1 and2 |
	and1 := a /\ b.
	and2 := c /\ notA.
	or1 := and1 \/ and2.
	result := or1 atomicTerms.
	self
		should: [result size = 3];
		should: [result includes: a];
		should: [result includes: b];
		should: [result includes: c]