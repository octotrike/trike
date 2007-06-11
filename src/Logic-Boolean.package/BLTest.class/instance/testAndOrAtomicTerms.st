test Boolean logic
testAndOrAtomicTerms
	| result or1 or2 and1 |
	or1 := a \/ b.
	or2 := c \/ d.
	and1 := or1 /\ or2.
	result := and1 atomicTerms.
	self
		should: [result size = 4];
		should: [result includes: a];
		should: [result includes: b];
		should: [result includes: c];
		should: [result includes: d].