test Boolean logic
testOrAndAtomicTerms
	| result or1 and1 and2 |
	and1 := a /\ b.
	and2 := c /\ d.
	or1 := and1 \/ and2.
	result := or1 atomicTerms.	self
		should: [result size = 4];
		should: [result includes: a];
		should: [result includes: b];
		should: [result includes: c];
		should: [result includes: d]